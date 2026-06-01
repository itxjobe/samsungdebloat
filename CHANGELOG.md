# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Planned
- Screenshots for visual guide
- Video tutorials
- Additional community configurations
- OneUI 8.1 compatibility testing

---

## [1.2.3] - 2026-06-01

### Changed
- Replaced the "undocumented services" note in `07-s26-ultra.txt` with accurate descriptions from on-device inspection: `mhs.ai` is a Mobile Hotspot helper (WiFi-state only), `mocca` is a Samsung Apps/Galaxy Store helper, and `moaiapc` is a privileged system component

---

## [1.2.2] - 2026-06-01

### Added
- Packages verified on-device and added to the lists: Samsung Shop (`com.samsung.ecomm`), PENUP (`com.sec.penup`), Google Play Books and News/Magazines, the English-Spanish translation pack, and the Bixby Spanish on-device pack (`...ondevice.esus`)
- `07-s26-ultra.txt` now lists the actual US SM-S948U1 Text-to-Speech pack names

### Changed
- README is now device-neutral in the body (no longer refers only to the S25 Edge)

---

## [1.2.1] - 2026-06-01

### Added
- Verified OneUI 8.5 Galaxy AI package names (Samsung AI Core, Google AICore, Call Assistant, Smart Call, Bixby Vision, Interpreter, Photo editor, Gallery) documented as keep notes in `06-oneui8-specific.txt` and DEVICE-COMPARISON.md

### Changed
- Validated the S26 Ultra packages on-device against a Galaxy S26 Ultra (SM-S948U1, OneUI 8.5)
- `07-s26-ultra.txt` now notes region/variant differences (some packages, including SwiftKey and several Text-to-Speech voice packs, are not present on every unit)

---

## [1.2.0] - 2026-06-01

### Added
- Galaxy S26 Ultra (OneUI 8.5 / Android 16) support
- `07-s26-ultra.txt` - package list verified on a Galaxy S26 Ultra (SM-S948B), grouped by risk (safe, Text-to-Speech voice packs, optional, caution)
- `canta-lists/s26-ultra.json` - Canta preset for the safe S26 Ultra extras
- `termux-scripts/s26-ultra-debloat.sh` - Termux script for the safe S26 Ultra extras
- `tool-configs/adb-appcontrol-s26-ultra.txt` - ADB AppControl import list for the S26 Ultra

### Changed
- Broadened the project to cover both the S25 series (OneUI 8) and the S26 Ultra (OneUI 8.5)
- README retitled and updated for S25 / S26 coverage
- DEVICE-COMPARISON.md now documents the Galaxy S26 series and OneUI 8.5

---

## [1.1.1] - 2026-06-01

### Fixed
- `scripts/auto-debloat.sh` no longer aborts mid-run. It previously used `set -e`, so the first package that was already removed (a normal, expected case) would stop the entire script. Error handling is now per-package.
- The "no device connected" message now actually prints. The connection check exited before reaching the help text, leaving users with a silent failure.
- Package removal is now reported accurately. `adb shell` returns success even when `pm` reports a failure, so the script now checks `pm`'s own output and counts removed vs. skipped correctly.
- The package-name parser now handles names with uppercase letters and underscores. Eight packages were being silently skipped, including Amazon Shopping (`com.amazon.mShop.android.shopping`), Smart Switch (`com.sec.android.easyMover`), and AT&T myWireless (`com.att.myWireless`).

### Added
- `remove-bixby.txt` - ADB command list for the "Remove Bixby" option in the automated script (the custom menu previously pointed at a file that did not exist).

---

## [1.1.0] - 2025-10-25

### Added
- On-device debloat support via Shizuku + Canta
- Termux shell scripts for on-device execution
- Canta package import lists (conservative, moderate, remove-bixby)
- ON-DEVICE-DEBLOAT.md - comprehensive on-device guide
- FAQ.md - frequently asked questions
- VISUAL-GUIDE.md - step-by-step visual instructions
- CONTRIBUTING.md - contribution guidelines
- ADB-SETUP-GUIDE.md - detailed ADB installation guide
- WIRELESS-ADB-SETUP.md - wireless ADB configuration
- DEVICE-COMPARISON.md - S25 model differences
- POST-UPDATE-GUIDE.md - what to do after OneUI updates
- PERFORMANCE-TESTING.md - how to measure improvements
- SAFE-MODE-RECOVERY.md - emergency recovery procedures
- Community configurations folder
- GitHub issue and PR templates
- LICENSE file (MIT)

### Changed
- Updated README.md with on-device method information
- Reorganized repository structure for better navigation

---

## [1.0.0] - 2025-10-25

### Added
- Initial release for OneUI 8.0
- 6 categorized debloat scripts:
  - 01-safe-user-apps.txt
  - 02-bloatware-carriers.txt
  - 03-safe-system-apps.txt
  - 04-optional-removals.txt
  - 05-ai-assistant-options.txt
  - 06-oneui8-specific.txt
- batch-commands.txt with pre-made batch removal commands
- README.md - main documentation
- QUICKSTART.md - quick start guide for ADB method
- RESTORE-GUIDE.md - comprehensive restoration procedures
- SUGGESTIONS.md - advanced tips and optimizations
- package-reference.md - detailed package information

### Features
- Support for Samsung Galaxy S25 Edge
- Compatible with OneUI 8.0 / Android 16
- Preserves Bixby and Gemini functionality
- No root required
- Fully reversible via factory reset or ADB restore
- Organized by safety level
- Comprehensive package documentation

### Tested On
- Samsung Galaxy S25 Edge
- OneUI 8.0
- Android 16

---

## Version Naming

- **Major version (X.0.0)**: OneUI major version support, breaking changes
- **Minor version (1.X.0)**: New features, new packages, documentation additions
- **Patch version (1.0.X)**: Bug fixes, typo corrections, small updates

---

## How to Update

### For Users

**To get latest version:**
```bash
git pull origin main
```

**Or download latest release:**
- Visit: https://github.com/itxjobe/samsungdebloat/releases
- Download latest ZIP
- Extract and use

### After Updating

1. Review CHANGELOG.md for new packages
2. Check if new scripts apply to your setup
3. Re-run specific scripts if desired
4. Read any new documentation

---

## Compatibility Matrix

| Version | OneUI | Android | S25 Edge | S25/S25+ | S25 Ultra | S26 Ultra | Notes |
|---------|-------|---------|----------|----------|-----------|-----------|-------|
| 1.2.0   | 8.5   | 16      | ✅       | ✅       | ✅        | ✅        | S26 Ultra list verified (SM-S948B) |
| 1.1.0   | 8.0   | 16      | ✅       | ✅       | ✅        | ⚠️        | Full S25 support |
| 1.1.0   | 8.5   | 16      | ✅       | ✅       | ✅        | ⚠️        | Expected compatible |
| 1.0.0   | 8.0   | 16      | ✅       | ⚠️       | ⚠️        | ❌        | Basic support |

**Legend:**
- ✅ Fully tested and supported
- ⚠️ Expected to work, limited testing
- ❌ Not supported

---

## Breaking Changes

### Version 1.1.0
- None (backward compatible with 1.0.0)

### Version 1.0.0
- Initial release (no previous versions)

---

## Deprecations

None currently.

---

## Security Updates

None currently. This repository does not modify system security.

---

## Contributors

Thank you to everyone who has contributed to this project:

- Community testers and feedback providers
- XDA Forums community
- Reddit r/GalaxyS25 community

See CONTRIBUTING.md for how to contribute.

---

## Reporting Issues

Found a bug or issue?

1. Check existing issues: https://github.com/itxjobe/samsungdebloat/issues
2. Read FAQ.md for common questions
3. Submit new issue with template

---

**Last Updated:** October 2025
