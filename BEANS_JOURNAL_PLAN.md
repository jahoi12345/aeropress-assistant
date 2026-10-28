# Beans Journal – Plan & Add-Bean Options

## Current state

- **BeansJournalView**: List of beans, empty state, “+” opens `AddBeanView`.
- **AddBeanView**: Simple form — Name, Roaster, Roast Level (picker), Origin, Tasting Notes.
- **Bean model**: `id`, `name`, `roaster`, `roastLevel` (String), `origin`, `tastingNotes`.
- **RecipeData**: holds `beans: [Bean]`. Beans can be chosen from **ActiveBrewView** (“Beans” button) when finishing a brew.

---

## Suggested beans journal structure

1. **List (BeansJournalView)**  
   - Keep: list of beans, empty state, toolbar (Settings, Add).  
   - Add (optional): search/filter by name, roaster, origin, roast level; sort (date added, name, roaster); tap row → **Bean detail**.

2. **Add / Edit bean**  
   - Single form used for both “Add Bean” and “Edit Bean”.  
   - Use the extensive options below; group into sections and make most fields optional so the form stays usable.

3. **Bean detail view (new)**  
   - Show all saved fields for one bean.  
   - Optional: “Brews with this bean” (journal entries where `beanName` matches or links to this `Bean.id`).  
   - Edit button → same form as Add, pre-filled.

4. **Linking beans to brews**  
   - When logging a brew (Add Journal Entry) or finishing from Active Brew, allow picking a **saved bean** (from `data.beans`) instead of free text, so “Beans” in the brew journal can link to the beans journal.

---

## Extensive list of options for the “Add Bean” menu

Below are options you can add to the Add/Edit Bean form. Use **pickers/menus** where a fixed list is given; use **text fields** or **multi-line** where it’s free text. All of these can be optional so the core flow stays quick.

---

### 1. Identity & basics

| Field | Type | Options / notes |
|-------|------|------------------|
| **Name / blend** | Text | Coffee name or blend (e.g. “Ethiopian Yirgacheffe”, “House Blend”). Required. |
| **Roaster** | Text | Roaster or brand. |
| **Roaster location** | Text or picker | City/country of roaster. Optional. |
| **Product line / series** | Text | e.g. “Single Origin”, “Reserve”, “Seasonal”. |
| **Variant** | Text | e.g. “Decaf”, “Light roast batch #42”. |
| **Barcode / SKU** | Text | For tracking the exact product. |

---

### 2. Roast & processing

| Field | Type | Options / notes |
|-------|------|------------------|
| **Roast level** | Picker | Light, Medium-Light, Medium, Medium-Dark, Dark. (Align with `RoastLevel` enum.) |
| **Roast date** | Date picker | When the beans were roasted. |
| **Process** | Picker | Washed, Natural, Honey, Anaerobic, Carbonic Maceration, Wet-hulled, Other. |
| **Decaf** | Picker / toggle | Yes / No. |
| **Decaf method** | Picker | Swiss Water, CO2, EA (ethyl acetate), Sugarcane (SWP), Other, Not applicable. |
| **Blend vs single origin** | Picker | Single origin, Blend, Blend (single-origin components listed). |

---

### 3. Origin & variety

| Field | Type | Options / notes |
|-------|------|------------------|
| **Origin** | Text or picker | Country or region (e.g. Ethiopia, Colombia, Kenya). |
| **Region** | Text | e.g. Yirgacheffe, Sidama, Nariño. |
| **Farm / producer / cooperative** | Text | Optional. |
| **Variety** | Picker or text | Typica, Bourbon, Caturra, Geisha/Gesha, SL28, SL34, Heirloom, Catimor, etc. — or free text. |
| **Altitude** | Text or number | e.g. “1800–2200 m” or “1900 masl”. |
| **Harvest year / season** | Text or date | e.g. “2024”, “2024 harvest”. |

---

### 4. Tasting & flavour (roaster / your notes)

| Field | Type | Options / notes |
|-------|------|------------------|
| **Tasting notes** | Multi-line text | Roaster or your notes (e.g. “Blueberry, jasmine, citrus”). |
| **Suggested tasting notes** | Picker (multi-select) | Predefined list: Berry, Stone fruit, Citrus, Apple, Tropical, Floral, Chocolate, Caramel, Nutty, Spice, Wine, Tea-like, Earthy, Herbal, etc. |
| **Body** | Picker | Light, Medium-Light, Medium, Medium-Full, Full. |
| **Acidity** | Picker | Low, Medium-Low, Medium, Medium-High, High. |
| **Sweetness** | Picker | Low, Medium-Low, Medium, Medium-High, High. |
| **Your rating** | Picker or stars | 1–5 stars (or 1–10) for the bean overall. |
| **Best for** | Picker (multi-select) | AeroPress, Espresso, Filter, French press, Cold brew, Milk drinks, Black only, etc. |

---

### 5. Purchase & storage

| Field | Type | Options / notes |
|-------|------|------------------|
| **Purchase date** | Date picker | When you bought it. |
| **Purchase place** | Text | e.g. “Roaster website”, “Local café”, “Supermarket”. |
| **Price** | Text or number | Optional; consider currency. |
| **Bag size** | Picker or text | 250 g, 340 g, 12 oz, 1 lb, 1 kg, Other. |
| **Open date** | Date picker | When you opened the bag. |
| **Use-by / best-by** | Date picker | If printed on bag. |
| **Storage** | Picker | Pantry, fridge, freezer, vacuum canister, other. |

---

### 6. Grind & brew (suggested starting point)

| Field | Type | Options / notes |
|-------|------|------------------|
| **Recommended grind** | Picker or text | Fine, Medium-fine, Medium, Medium-coarse, Coarse; or grind number. |
| **Recommended brew method** | Picker (multi-select) | AeroPress, Espresso, Pour-over, French press, etc. |
| **Recommended water temp** | Text or number | e.g. “92–96 °C”. |
| **Recommended ratio** | Text | e.g. “1:15”, “1:12”. |
| **Notes for AeroPress** | Multi-line | Your own AeroPress-specific notes. |

---

### 7. Tags & organisation

| Field | Type | Options / notes |
|-------|------|------------------|
| **Tags** | Multi-select or comma-separated text | e.g. Favourite, Gift, Subscription, Competition, Rebuy, Limited edition. |
| **Favourite** | Toggle | Star or heart for quick access. |
| **Wishlist / to try** | Toggle | Not yet opened or not yet brewed. |
| **Finished / archived** | Toggle | Bag finished; hide from “current” list or show in “Past beans”. |
| **Private** | Toggle | Hide from export or sharing. |

---

### 8. Media & extras

| Field | Type | Options / notes |
|-------|------|------------------|
| **Photo** | Image picker | Bag or beans. |
| **Link** | URL | Roaster page or product link. |
| **Lot / batch number** | Text | If on the bag. |
| **Certifications** | Picker (multi-select) | Organic, Fair Trade, Rainforest Alliance, Direct trade, etc. |
| **Notes** | Multi-line | Anything else. |

---

## Suggested grouping in the Add Bean form

- **Required / quick**: Name, Roaster, Roast level, Origin, Tasting notes (current flow).
- **Section “Origin & process”**: Process, Decaf, Blend vs single origin, Region, Variety, Altitude.
- **Section “Roast & dates”**: Roast date, Open date, Purchase date, Bag size, Storage.
- **Section “Tasting”**: Suggested tasting notes (multi-select), Body, Acidity, Sweetness, Your rating, Best for.
- **Section “Brew tips”**: Recommended grind, Recommended brew method, Water temp, Ratio, AeroPress notes.
- **Section “Purchase”**: Purchase place, Price, Use-by.
- **Section “Organise”**: Tags, Favourite, Wishlist, Finished, Private.
- **Section “Extras”**: Photo, Link, Lot number, Certifications, Notes.

You can start with the current fields plus **Roast date**, **Process**, **Purchase date**, and **Your rating**, then add more sections from the table as needed.

---

## Model suggestion (Swift)

Extend `Bean` with optional properties so the new fields are backward-compatible (existing beans keep working). Example additions:

- `roastDate`, `process`, `decaf`, `decafMethod`, `blendType`
- `region`, `farm`, `variety`, `altitude`, `harvestYear`
- `body`, `acidity`, `sweetness`, `suggestedTastingNotes` (array or string), `yourRating`, `bestFor`
- `purchaseDate`, `purchasePlace`, `price`, `bagSize`, `openDate`, `useByDate`, `storage`
- `recommendedGrind`, `recommendedBrewMethods`, `recommendedTemp`, `recommendedRatio`, `aeroPressNotes`
- `tags`, `isFavorite`, `isWishlist`, `isFinished`, `isPrivate`
- `photoData`, `productURL`, `lotNumber`, `certifications`, `notes`
- `dateAdded` (for sorting “newest first”)

Use enums where you have a fixed set (e.g. Process, DecafMethod, Storage, Body) and store the rest as strings or arrays of strings.

---

## Summary

- **Plan**: Keep list + add/edit; add Bean detail and optional link from brews to beans.
- **Menu options**: Use the tables above to add pickers and fields to the Add/Edit Bean form in sections; keep most optional so “Add Bean” stays fast.
- **Model**: Extend `Bean` with optional properties and enums for the new options; persist in `RecipeData` (or your current storage) so beans journal and brew journal stay in sync.

If you tell me which sections you want first (e.g. “Origin & process” + “Roast & dates” only), I can outline the exact `Bean` properties and a minimal Add Bean UI for those.
