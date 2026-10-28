import Foundation
import Combine

class TimerManager: ObservableObject {
    @Published var recipe: Recipe?
    @Published var currentStepIndex: Int = 0
    @Published var timeRemainingInStep: Int = 0
    @Published var totalTimeElapsed: Int = 0
    @Published var isRunning: Bool = false
    @Published var isFinished: Bool = false
    
    /// Sub-second values for millisecond display (0...<1 when running).
    @Published var totalTimeElapsedDisplay: Double = 0
    @Published var timeRemainingInStepDisplay: Double = 0
    
    /// Called when a step completes (timer hits 0) or brew finishes. Use for sounds/haptics.
    var onStepCompleted: (() -> Void)?
    
    private var timer: AnyCancellable?
    private var displayTimer: AnyCancellable?
    private var lastTickDate: Date?
    
    private var autoAdvance: Bool {
        UserDefaults.standard.object(forKey: SettingsKeys.timerAutoAdvance) as? Bool ?? true
    }
    
    var currentStep: RecipeStep? {
        guard let recipe = recipe, currentStepIndex < recipe.steps.count else { return nil }
        return recipe.steps[currentStepIndex]
    }
    
    var progress: Double {
        guard let recipe = recipe else { return 0 }
        let total = Double(recipe.totalTime)
        guard total > 0 else { return 0 }
        return min(1.0, Double(totalTimeElapsed) / total)
    }

    /// Smooth progress for 120fps ring updates (uses sub-second display when running).
    /// When paused, uses totalTimeElapsedDisplay so the bar stays exactly where it was.
    var progressForDisplay: Double {
        guard let recipe = recipe else { return 0 }
        let total = Double(recipe.totalTime)
        guard total > 0 else { return 0 }
        return min(1.0, totalTimeElapsedDisplay / total)
    }
    
    func setup(with recipe: Recipe) {
        self.recipe = recipe
        self.currentStepIndex = 0
        self.totalTimeElapsed = 0
        self.isFinished = false
        self.isRunning = false
        self.totalTimeElapsedDisplay = 0
        self.timeRemainingInStepDisplay = 0
        self.lastTickDate = nil
        if !recipe.steps.isEmpty {
            self.timeRemainingInStep = recipe.steps[0].durationSeconds
            self.timeRemainingInStepDisplay = Double(recipe.steps[0].durationSeconds)
        }
    }
    
    func toggle() {
        if isRunning {
            pause()
        } else {
            start()
        }
    }
    
    func start() {
        guard !isFinished, recipe != nil else { return }
        guard currentStep?.durationSeconds ?? 0 > 0 else { return }
        isRunning = true
        lastTickDate = Date()
        totalTimeElapsedDisplay = Double(totalTimeElapsed)
        if let step = currentStep, step.durationSeconds > 0 {
            timeRemainingInStepDisplay = Double(timeRemainingInStep)
        }
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
        startDisplayTimer()
    }
    
    func pause() {
        isRunning = false
        timer?.cancel()
        timer = nil
        displayTimer?.cancel()
        displayTimer = nil
        // Keep totalTimeElapsedDisplay as-is so the progress bar stays exactly where it was
        timeRemainingInStepDisplay = Double(timeRemainingInStep)
    }
    
    func stop() {
        pause()
        if let recipe = recipe {
            setup(with: recipe)
        }
    }
    
    func skipToNextStep() {
        guard let recipe = recipe else { return }
        // When skipping the last step, stop the timer immediately so it doesn't keep running
        if currentStepIndex == recipe.steps.count - 1 {
            pause()
        }
        lastTickDate = Date()
        // Advance elapsed time by the remaining time we're skipping so progress bar jumps to end of current step
        if let step = currentStep, step.durationSeconds > 0, timeRemainingInStep > 0 {
            totalTimeElapsed += timeRemainingInStep
            totalTimeElapsedDisplay = Double(totalTimeElapsed)
        }
        if currentStepIndex < recipe.steps.count - 1 {
            currentStepIndex += 1
            timeRemainingInStep = recipe.steps[currentStepIndex].durationSeconds
            timeRemainingInStepDisplay = Double(recipe.steps[currentStepIndex].durationSeconds)
            // When skipping to a 0-duration step, stop the timer until user taps Next Step again
            if recipe.steps[currentStepIndex].durationSeconds == 0 {
                pause()
            }
        } else {
            finishBrew()
        }
    }

    /// Advance past all prep steps to the first non-prep step (e.g. when user taps "Finish prep").
    func skipPastPrep() {
        guard let recipe = recipe else { return }
        let prepEndIndex = recipe.steps.firstIndex(where: { $0.action != .prep }) ?? recipe.steps.count
        guard currentStepIndex < prepEndIndex else { return }
        lastTickDate = Date()
        if prepEndIndex < recipe.steps.count {
            currentStepIndex = prepEndIndex
            timeRemainingInStep = recipe.steps[currentStepIndex].durationSeconds
            timeRemainingInStepDisplay = Double(recipe.steps[currentStepIndex].durationSeconds)
        } else {
            finishBrew()
        }
    }
    
    private func startDisplayTimer() {
        let interval = 1.0 / 120.0
        displayTimer = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateDisplayTime()
            }
    }
    
    private func updateDisplayTime() {
        guard isRunning, let last = lastTickDate else { return }
        let elapsedSinceTick = Date().timeIntervalSince(last)
        totalTimeElapsedDisplay = Double(totalTimeElapsed) + elapsedSinceTick
        timeRemainingInStepDisplay = max(0, Double(timeRemainingInStep) - elapsedSinceTick)
    }
    
    private func tick() {
        guard let recipe = recipe, let step = currentStep else { return }
        
        // 0-duration steps pause the timer and wait for manual advancement
        if step.durationSeconds == 0 {
            return
        }

        totalTimeElapsed += 1
        lastTickDate = Date()
        
        if timeRemainingInStep > 0 {
            timeRemainingInStep -= 1
        }
        
        if timeRemainingInStep == 0 {
            onStepCompleted?()
            if autoAdvance {
                if currentStepIndex < recipe.steps.count - 1 {
                    currentStepIndex += 1
                    timeRemainingInStep = recipe.steps[currentStepIndex].durationSeconds
                    timeRemainingInStepDisplay = Double(recipe.steps[currentStepIndex].durationSeconds)
                } else {
                    finishBrew()
                }
            }
        }
        updateDisplayTime()
    }
    
    private func finishBrew() {
        onStepCompleted?()
        pause()
        isFinished = true
        timeRemainingInStep = 0
    }
}
