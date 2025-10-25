# Samsung Galaxy S25 Edge OneUI 8 Debloat Script

Comprehensive ADB debloat script for Samsung Galaxy S25 Edge running OneUI 8 (Android 16). This script allows you to remove bloatware and unnecessary apps to improve performance, battery life, and privacy.

## Features

- **OneUI 8 Compatible**: Tested and updated for Android 16 / OneUI 8
- **S25 Edge Optimized**: Specifically tailored for the Galaxy S25 Edge
- **Bixby & Gemini Preserved**: Options to keep AI assistants functional
- **Categorized Removal**: Organized by safety level and app category
- **No Root Required**: Uses ADB commands only
- **Reversible**: Apps can be restored via factory reset or individual reinstall

## Prerequisites

Before starting, you need:

1. **USB Debugging Enabled** on your S25 Edge
   - Settings > About phone > Tap "Build number" 7 times
   - Settings > Developer options > Enable "USB debugging"

2. **ADB (Android Debug Bridge)** installed on your computer
   - Download from: https://developer.android.com/tools/releases/platform-tools
   - Extract to a folder and add to PATH (optional)

3. **USB Cable** to connect phone to computer

4. **Samsung USB Drivers** (Windows only)
   - Download from Samsung's website

## Important Warnings

### CRITICAL - DO NOT REMOVE:
- **Samsung Keyboard** (`com.samsung.android.honeyboard`) - Causes bootloop with DEX
- **Knox Components** - May lock your device
- **Samsung Intelligence Voice Services** - Breaks Galaxy AI features
- **SystemUI or Core Services** - Will brick your device

### Keep for Bixby:
- `com.samsung.android.bixby.agent`
- `com.samsung.android.bixby.wakeup`
- `com.samsung.android.visionintelligence` (Bixby Vision)

### Keep for Gemini/Google AI:
- `com.google.android.apps.bard` (Gemini)
- `com.google.android.googlequicksearchbox` (Google Search - required for Gemini)
- Samsung AI Core (installed separately from Galaxy Store)

### Keep for DEX:
- `com.samsung.android.mdx` (Samsung DEX)
- `com.samsung.android.honeyboard` (Samsung Keyboard)

## Usage

### Method 1: Individual Commands (Recommended for Beginners)

1. Connect your S25 Edge via USB
2. Open terminal/command prompt
3. Verify connection: `adb devices`
4. Copy individual commands from the script files
5. Paste and run each command one at a time

Example:
```bash
adb shell pm uninstall --user 0 com.facebook.katana
```

### Method 2: Batch Commands (Advanced)

1. Connect your device
2. Copy the entire batch command from the script
3. Run all commands at once

**Warning**: Review batch commands carefully before executing!

### Method 3: Using ADB AppControl (GUI Tool)

1. Download ADB AppControl from: https://adbappcontrol.com/
2. Connect your device
3. Import the provided debloat list
4. Select packages to remove/disable
5. Apply changes

## Script Categories

The debloat commands are organized into these files:

- `01-safe-user-apps.txt` - Safest removals (Samsung/Google user apps)
- `02-bloatware-carriers.txt` - Carrier bloatware
- `03-safe-system-apps.txt` - Safe system app disables
- `04-optional-removals.txt` - Optional (may break features)
- `05-ai-assistant-options.txt` - Bixby/Gemini removal (if desired)
- `06-oneui8-specific.txt` - OneUI 8 new apps and features
- `batch-commands.txt` - Pre-made batch removal commands

## Recommended Debloat Levels

### Conservative (Recommended for Most Users)
Run: `01-safe-user-apps.txt` + `02-bloatware-carriers.txt`

**Removes**: Facebook, carrier apps, some Samsung duplicates
**Preserves**: All Samsung features, Bixby, Gemini, DEX

### Moderate
Conservative + `03-safe-system-apps.txt` + Select items from `04-optional-removals.txt`

**Removes**: Additional Samsung services, some Google apps
**May affect**: Samsung Pay, AR features, some Samsung integrations

### Aggressive (Advanced Users Only)
All categories

**Removes**: Most Samsung/Google apps
**Will break**: Many Samsung features, integrations, possibly DEX

## How to Restore Apps

### Individual App Restore
```bash
adb shell cmd package install-existing <package_name>
```

### Full Restore
Factory reset your device (Settings > General management > Reset)

## OneUI 8 Specific Changes

OneUI 8 introduces new apps and features:

- **Galaxy AI Integration**: Enhanced with Gemini
- **New Packages**: Circle to Search, AI Core features
- **Updated**: Camera stickers, AR features, Samsung Pass

See `06-oneui8-specific.txt` for details.

## Compatibility

- **Tested On**: Samsung Galaxy S25 Edge
- **OneUI Version**: 8.0 / 8.5
- **Android Version**: 16
- **Should work on**: S25, S25+, S25 Ultra with OneUI 8

## Post-Debloat Checklist

After debloating, verify these features still work (if you use them):

- [ ] Phone calls and SMS
- [ ] Camera
- [ ] Samsung Keyboard (if using DEX)
- [ ] Bixby (if desired)
- [ ] Gemini/Google Assistant (if desired)
- [ ] Samsung Pay (if not removed)
- [ ] Samsung DEX (if using)
- [ ] Secure Folder
- [ ] Knox features
- [ ] Circle to Search

## Tips for Best Results

1. **Update First**: Fully update all apps before debloating
2. **Backup Data**: Backup important data before proceeding
3. **Review Commands**: Don't blindly copy/paste - know what you're removing
4. **Start Small**: Begin with safe categories, expand as needed
5. **Test Features**: Check critical features after each category
6. **Keep Notes**: Document what you removed in case you need to restore

## Sources & Research

This script was compiled from:
- XDA Forums S25 debloat threads
- Tom4tot's Galaxy S24 Debloat Script
- Community feedback on Reddit (r/GalaxyS25, r/Android)
- Official Samsung package documentation
- Personal testing on S25 Edge with OneUI 8

## Disclaimer

**USE AT YOUR OWN RISK**

- Removing system apps may cause instability
- Some features may break even with "safe" removals
- Always research packages before removing
- Author is not responsible for any issues
- Backup your data before proceeding

## Support & Contributions

Found an issue or want to contribute?
- Report issues with specific package names and symptoms
- Share your tested debloat configurations
- Submit pull requests with improvements

## License

MIT License - Free to use and modify

---

**Last Updated**: October 2025
**OneUI Version**: 8.0
**Device**: Samsung Galaxy S25 Edge
