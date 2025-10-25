# Samsung Galaxy S25 Edge OneUI 8 Debloat Script

![GitHub stars](https://img.shields.io/github/stars/itxjobe/samsungdebloat?style=social)
![GitHub forks](https://img.shields.io/github/forks/itxjobe/samsungdebloat?style=social)
![License](https://img.shields.io/github/license/itxjobe/samsungdebloat)
![Last commit](https://img.shields.io/github/last-commit/itxjobe/samsungdebloat)

Comprehensive ADB debloat script for Samsung Galaxy S25 Edge running OneUI 8 (Android 16). This script allows you to remove bloatware and unnecessary apps to improve performance, battery life, and privacy.

> **TL;DR**: Remove bloatware from Samsung S25 Edge (OneUI 8) without root. Download [Canta presets](canta-lists/) → Import in app → Done in 5 minutes. See [Quick Start](#quick-start-easiest-method).

⭐ **Found this helpful? [Star this repo](https://github.com/itxjobe/samsungdebloat) to help others find it!**

## Table of Contents
- [Features](#features)
- [Quick Start (Easiest Method)](#quick-start-easiest-method)
- [Debloat Methods](#debloat-methods)
- [Prerequisites (For ADB Method)](#prerequisites-for-adb-method)
- [Important Warnings](#important-warnings)
- [Usage](#usage)
- [Package Categories](#package-categories)
- [Repository Structure](#repository-structure)
- [Testing After Debloat](#testing-after-debloat)
- [Tips for Best Results](#tips-for-best-results)
- [Sources & Research](#sources--research)
- [Credits & Acknowledgments](#credits--acknowledgments)
- [Community & Support](#community--support)
- [Disclaimer](#disclaimer)
- [License](#license)

## Features

- **OneUI 8 Compatible**: Tested and updated for Android 16 / OneUI 8
- **S25 Edge Optimized**: Specifically tailored for the Galaxy S25 Edge
- **Bixby & Gemini Preserved**: Options to keep AI assistants functional
- **Categorized Removal**: Organized by safety level and app category
- **No Root Required**: Uses ADB commands only
- **Reversible**: Apps can be restored via factory reset or individual reinstall

## Quick Start (Easiest Method)

**The fastest way to debloat your S25 Edge - no computer needed after initial setup!**

1. **One-time setup** (5 minutes):
   - Enable USB Debugging on phone (Settings > About phone > tap Build number 7x)
   - Enable Wireless Debugging (Settings > Developer options)
   - Connect phone to computer and run: `adb pair` (see [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md))

2. **Install apps on phone**:
   - [Shizuku](https://shizuku.rikka.app/) - Provides ADB permissions
   - [Canta](https://github.com/samolego/Canta) - Debloat GUI app

3. **Download preset**:
   - Download [`conservative.json`](canta-lists/conservative.json) to your phone
   - Or browse all [Canta presets](canta-lists/)

4. **Import and debloat**:
   - Open Canta app
   - Menu (⋮) > Import Preset
   - Select `conservative.json`
   - Review packages > Uninstall
   - Reboot phone

**Done!** Your phone is debloated. See [ON-DEVICE-DEBLOAT.md](ON-DEVICE-DEBLOAT.md) for detailed instructions.

## Debloat Methods

Choose the method that works best for you:

### On-Device (No Computer Needed)
- **Shizuku + Canta** - Easy GUI app (one-time computer setup)
- **Shizuku + App Manager** - More advanced on-device option
- **Termux** - Run scripts directly on your phone
- See `ON-DEVICE-DEBLOAT.md` for complete guide

### From Computer (Traditional ADB)
- Individual commands
- Batch commands
- ADB AppControl GUI tool
- See instructions below

## Prerequisites (For ADB Method)

If using the traditional ADB method from computer:

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

### On-Device Methods (Recommended for Most Users)

**See `ON-DEVICE-DEBLOAT.md` for complete instructions**

#### Quick Start - Shizuku + Canta:
1. Setup Shizuku (one-time with computer)
2. Install Canta app
3. Import package lists from `canta-lists/` folder
4. Select and remove bloatware with GUI
5. Reboot

**Advantages:** Visual interface, no constant computer connection, easier to use

---

### Computer-Based Methods

#### Method 1: Individual Commands (Recommended for Beginners)

1. Connect your S25 Edge via USB
2. Open terminal/command prompt
3. Verify connection: `adb devices`
4. Copy individual commands from the script files
5. Paste and run each command one at a time

Example:
```bash
adb shell pm uninstall --user 0 com.facebook.katana
```

#### Method 2: Batch Commands (Advanced)

1. Connect your device
2. Copy the entire batch command from the script
3. Run all commands at once

**Warning**: Review batch commands carefully before executing!

#### Method 3: Using ADB AppControl (GUI Tool)

1. Download ADB AppControl from: https://adbappcontrol.com/
2. Connect your device
3. Import the provided debloat list
4. Select packages to remove/disable
5. Apply changes

## Repository Structure

### Debloat Scripts (ADB Commands)
- `01-safe-user-apps.txt` - Safest removals (Samsung/Google user apps)
- `02-bloatware-carriers.txt` - Carrier bloatware
- `03-safe-system-apps.txt` - Safe system app disables
- `04-optional-removals.txt` - Optional (may break features)
- `05-ai-assistant-options.txt` - Bixby/Gemini removal (if desired)
- `06-oneui8-specific.txt` - OneUI 8 new apps and features
- `batch-commands.txt` - Pre-made batch removal commands

### On-Device Files
- `canta-lists/` - Package lists for Canta app import
- `termux-scripts/` - Shell scripts for Termux
- `ON-DEVICE-DEBLOAT.md` - Complete on-device guide

### Documentation
- `README.md` - This file
- `QUICKSTART.md` - Quick start guide for ADB method
- `RESTORE-GUIDE.md` - How to restore removed apps
- `SUGGESTIONS.md` - Tips, optimizations, and recommendations
- `package-reference.md` - Detailed package information

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

## Credits & Acknowledgments

This project utilizes and references several excellent open-source tools:

### Third-Party Tools
- **[Canta](https://github.com/samolego/Canta)** by [samolego](https://github.com/samolego) - Android app uninstaller without root
- **[Shizuku](https://shizuku.rikka.app/)** by [RikkaApps](https://github.com/RikkaApps) - Provides ADB-like permissions on-device
- **[App Manager](https://github.com/MuntashirAkon/AppManager)** by [Muntashir Akon](https://github.com/MuntashirAkon) - Advanced app management tool
- **[Universal Android Debloater](https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation)** by [Universal Debloater Alliance](https://github.com/Universal-Debloater-Alliance) - Package debloat lists and recommendations
- **[Termux](https://termux.dev/)** - Terminal emulator for Android

### Inspiration
- **[Tom4tot's Galaxy S24 Debloat Script](https://github.com/Tom4tot/Galaxy-S24-Debloat-Script)** - Original reference for S24 debloating

Special thanks to the XDA Forums community, r/GalaxyS25, and r/Android communities for testing and feedback.

## Community & Support

### Getting Help

- **Documentation**: Check [DOCUMENTATION-INDEX.md](DOCUMENTATION-INDEX.md) for all guides
- **FAQ**: See [FAQ.md](FAQ.md) for common questions
- **Issues**: Found a bug? [Report it here](https://github.com/itxjobe/samsungdebloat/issues)

### Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Reporting issues
- Suggesting package additions
- Sharing your debloat configuration
- Improving documentation

### Community Discussions

- **GitHub Discussions**: Enable in repository settings for Q&A and community chat
- **XDA Forums**: Share your experience and help others
- **Reddit**: r/GalaxyS25 and r/Android communities

### Stay Updated

- **Watch this repo** for updates to OneUI 8 debloat lists
- **Star this repo** to bookmark and help others discover it
- **Fork this repo** to customize for your needs

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
