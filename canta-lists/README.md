# Canta Import Presets

Package presets in JSON format for import into the [Canta](https://github.com/samolego/Canta) app.

Compatible with Canta 3.x and 4.x (checked against both versions' import code). Canta needs [Shizuku](../ON-DEVICE-DEBLOAT.md#which-shizuku-read-this-first) running; on Android 16 / 17 use the thedjchi fork.

## How to Use

Canta imports presets from the **clipboard or pasted text**. There is no file picker.

1. Open the preset you want on GitHub and tap **Raw**
2. Select all of the JSON text and copy it
3. Canta > **Presets** > **Import preset** > **Clipboard** (or paste into the **Text** tab)
4. Tap **Apply Preset**. Only apps that exist on your phone are selected
5. Review the selection and deselect anything you want to keep. **Applying a preset bypasses Canta's "unsafe app" guard**, so do not skip this step
6. Uninstall the selected apps and reboot

## Available Presets

### conservative.json
**Safest option** - Removes obvious bloatware only

Includes:
- Facebook apps
- Microsoft Office bloatware
- Third-party apps (Amazon, Netflix, LinkedIn, etc.)
- Samsung TV Plus, Game Launcher
- All carrier apps (errors for non-existent packages are normal)

**Recommended for:** Everyone, especially first-time debloaters

---

### moderate.json
**Balanced option** - Conservative + Samsung duplicates

Includes everything from conservative.json, plus:
- Samsung apps (Calendar, Notes, Browser, Messages)
- Samsung AR features (AR Zone, AR Emoji)
- Google apps (YouTube Music, Play Movies, Google Docs/Photos)

**Recommended for:** Users who prefer Google ecosystem over Samsung

**Before using:** Make sure you have Google alternatives installed
- Google Calendar (for Samsung Calendar)
- Google Keep (for Samsung Notes)
- Google Messages (for Samsung Messages)
- Chrome (for Samsung Internet)

---

### remove-bixby.json
**Optional** - Remove Bixby assistant

Removes:
- Bixby Agent (voice assistant)
- Bixby Wakeup ("Hi Bixby")
- Bixby Vision framework
- Bixby language packs

**Use if:** You prefer Gemini/Google Assistant

**Note:** This does NOT remove Bixby Routines (Modes & Routines), which is still useful even without Bixby voice

---

### remove-gemini.json
**Optional** - Remove Gemini assistant

Removes:
- Google Gemini app
- Google Bard integration

**Use if:** You prefer Bixby or Google Assistant

**Note:** Removes only Gemini AI assistant, keeps other Google services

---

### s26-ultra.json
**Galaxy S26 Ultra (OneUI 8.5)** - Verified safe extras

Adds safe removals captured from a real Galaxy S26 Ultra (SM-S948B), on top of the conservative/moderate presets:
- Samsung extras (My Galaxy, Moments, Sticker Center, Live Effects)
- SwiftKey (Samsung Keyboard stays)
- Unused Google components
- Text-to-Speech voice packs (storage)

**Recommended for:** S26 Ultra owners. Most packages also apply to the S25 series.

**Note:** Caution-level system services are intentionally excluded. See `07-s26-ultra.txt` for those. Since 1.3.0 this preset no longer removes Now Brief (`com.samsung.android.smartsuggestions`); it is in the OPTIONAL section of `07-s26-ultra.txt`.

---

### z-fold8.json
**Galaxy Z Fold 8 (OneUI 9)** - Safe extras

Adds safe removals for a Galaxy Z Fold 8 (SM-F971U1, OneUI 9 / Android 17), on top of the conservative/moderate presets:
- Samsung extras (Easy mode contacts widget, People edge panel, cold wallet, Warranty Care, GPUWatch)
- Unused Google and Android components (XR glasses stub, Voice Access, Linux terminal, easter egg)
- Text-to-Speech voice packs (storage)

**Recommended for:** Z Fold 8 owners. Most packages also exist on other OneUI 9 devices.

**Note:** Packages were inspected on-device but not removal-tested. Now Brief, optional features, and cover screen / Flex mode / Galaxy AI packages are intentionally excluded. See `08-z-fold8.txt`.

---

## Important Notes

### Before Importing

1. **Review the preset** - Open the `.json` file to see what packages will be removed
2. **Reference package-reference.md** - Understand what each package does
3. **Start with conservative** - You can always remove more later
4. **Backup important data** - Just in case

### After Importing

1. **Review selections in Canta** - Make sure nothing critical is selected
2. **Uncheck packages you want to keep** - Canta allows deselecting
3. **Confirm removal** - Double-check before confirming
4. **Reboot device** - After debloating, restart your phone

### If Something Breaks

See `RESTORE-GUIDE.md` for restoration procedures.

Quick restore command:
```
adb shell cmd package install-existing PACKAGE_NAME
```

Or factory reset to restore everything.

---

## Creating Custom Presets

You can create your own JSON preset:

1. Copy this template:
```json
{
  "name": "My Custom Preset",
  "description": "Description of what this removes",
  "createdDate": 1792108800000,
  "version": "1.0",
  "apps": [
    {"packageName": "com.facebook.katana"},
    {"packageName": "com.samsung.android.tvplus"},
    {"packageName": "com.google.android.apps.youtube.music"}
  ]
}
```
2. Edit the name, description and package list
3. Copy it and import it in Canta (Presets > Import preset)

**Format notes:**
- The list key is `apps`, not `packages`
- `name`, `description` and a numeric `createdDate` are required by Canta 3.x
- Keep each entry as `{"packageName": "..."}`. Canta 4.x also accepts plain strings (`"com.example.app"`), but Canta 3.x rejects them

Easier: uninstall the apps in Canta, then use **Presets > Create preset** to save them as a preset you can share.

Reference the main debloat scripts (`01-safe-user-apps.txt`, etc.) for package names.

---

## Troubleshooting

### "Package not found" errors
Normal - means the package doesn't exist on your device (e.g., wrong carrier)

### Can't find Import Preset option
Make sure you have Canta v3.0.0 or later (presets were added in v3.0.0). Import lives on the **Presets** screen. Update from F-Droid, IzzyOnDroid, GitHub or the Play Store if needed.

### Preset won't import ("Import failed")
- Copy the **Raw** view of the file, not the GitHub page around it
- Make sure you copied the whole JSON, from the first `{` to the last `}`
- For your own presets, check the format notes under [Creating Custom Presets](#creating-custom-presets)

### Some packages were not selected
Normal. Canta skips packages that are not installed on your phone, and drops anything that is not a valid package name.

---

**Last Updated:** October 2026 for OneUI 8, 8.5 and 9
