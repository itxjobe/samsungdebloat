# Canta Import Lists

Package lists formatted for import into Canta app.

## How to Use

1. Download the `.txt` file you want to your phone
2. Open Canta app
3. Menu > Import (if available) OR manually search for each package
4. Review the packages that will be removed
5. Confirm removal

## Available Lists

### conservative.txt
**Safest option** - Removes obvious bloatware only

Includes:
- Facebook apps
- Microsoft Office bloatware
- Third-party apps (Amazon, Netflix, LinkedIn, etc.)
- Samsung TV Plus, Game Launcher
- All carrier apps (errors for non-existent packages are normal)

**Recommended for:** Everyone, especially first-time debloaters

---

### moderate.txt
**Balanced option** - Conservative + Samsung duplicates

Includes everything from conservative.txt, plus:
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

### remove-bixby.txt
**Optional** - Remove Bixby assistant

Removes:
- Bixby Agent (voice assistant)
- Bixby Wakeup ("Hi Bixby")
- Bixby Vision framework
- Bixby language packs

**Use if:** You prefer Gemini/Google Assistant

**Note:** This does NOT remove Bixby Routines (Modes & Routines), which is still useful even without Bixby voice

---

## Important Notes

### Before Importing

1. **Review the package list** - Open the `.txt` file and check what will be removed
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

## Creating Custom Lists

You can create your own list:

1. Create a new `.txt` file
2. Add one package name per line
3. Example:
```
com.facebook.katana
com.samsung.android.tvplus
com.google.android.apps.youtube.music
```
4. Save and import to Canta

Reference the main debloat scripts (`01-safe-user-apps.txt`, etc.) for package names.

---

## Troubleshooting

### "Package not found" errors
Normal - means the package doesn't exist on your device (e.g., wrong carrier)

### Canta won't import
Try manual selection - search for each package and remove one by one

### Can't find Import option
Some Canta versions don't have import - you'll need to manually select packages

---

**Last Updated:** October 2025 for OneUI 8
