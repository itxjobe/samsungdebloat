# Canta Import Presets

Package presets in JSON format for import into Canta app.

## How to Use

1. Download the `.json` preset file you want to your phone
2. Open Canta app
3. Tap the menu (⋮) > Import Preset
4. Select the downloaded JSON file
5. Review the packages that will be imported
6. Select/deselect packages as needed
7. Confirm removal

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

1. Create a new `.json` file
2. Use this template:
```json
{
  "name": "My Custom Preset",
  "description": "Description of what this removes",
  "version": "1.0",
  "packages": [
    "com.facebook.katana",
    "com.samsung.android.tvplus",
    "com.google.android.apps.youtube.music"
  ]
}
```
3. Save and import to Canta

Reference the main debloat scripts (`01-safe-user-apps.txt`, etc.) for package names.

---

## Troubleshooting

### "Package not found" errors
Normal - means the package doesn't exist on your device (e.g., wrong carrier)

### Can't find Import Preset option
Make sure you have Canta v3.0.0 or later (preset import was added in v3.0.0). Update from Play Store or F-Droid if needed.

### Preset won't import
- Check the JSON file format is valid
- Try opening the preset file in a text editor to verify it's not corrupted
- Make sure file has .json extension

---

**Last Updated:** October 2025 for OneUI 8
