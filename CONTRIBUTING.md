# Contributing to Samsung S25 Edge Debloat

Thank you for considering contributing to this project! Community contributions help keep this repository up-to-date and useful for everyone.

## Table of Contents
1. [Ways to Contribute](#ways-to-contribute)
2. [Reporting Issues](#reporting-issues)
3. [Suggesting Package Removals](#suggesting-package-removals)
4. [Submitting Changes](#submitting-changes)
5. [Testing Requirements](#testing-requirements)
6. [Style Guidelines](#style-guidelines)
7. [Community Configurations](#community-configurations)

---

## Ways to Contribute

You can help this project in several ways:

### 1. Report Issues
Found a problem? Let us know!
- Package removal caused unexpected issues
- Incorrect package information
- Broken links or outdated information
- Documentation errors

### 2. Suggest Package Additions
Discovered new bloatware or safe-to-remove packages:
- New OneUI 8 bloatware
- Regional carrier bloatware
- Device-specific packages

### 3. Share Your Configuration
Help others by sharing your tested debloat setup:
- What you removed
- What you kept
- Results (battery, performance, etc.)

### 4. Improve Documentation
- Fix typos or unclear instructions
- Add missing information
- Create visual guides or screenshots
- Translate documentation

### 5. Test and Verify
- Test scripts on different S25 models
- Verify package information
- Test restore procedures

---

## Reporting Issues

### Before Reporting
1. **Search existing issues** - Your issue may already be reported
2. **Check FAQ.md** - Common questions answered there
3. **Test with conservative script** - Verify it's not an aggressive removal issue
4. **Try restore** - Confirm issue persists after restoring packages

### How to Report

**Good Issue Report:**
```markdown
**Device:** Samsung Galaxy S25 Edge
**OneUI Version:** 8.0
**Debloat Level:** Moderate

**Problem:**
After removing packages from 03-safe-system-apps.txt, Samsung Pay
stopped working.

**Steps to Reproduce:**
1. Ran moderate-debloat.sh
2. Rebooted device
3. Opened Samsung Pay
4. Error: "Samsung Pay has stopped"

**Packages Removed:**
- com.samsung.android.spayfw
- com.samsung.android.samsungpass

**Expected Behavior:**
Samsung Pay should still work

**Actual Behavior:**
Samsung Pay crashes on launch
```

**Issue Title Examples:**
- Good: "Samsung Pay broken after removing spayfw package"
- Bad: "App doesn't work"
- Good: "Package com.example.app safe to remove on S25+"
- Bad: "Add this package"

### What to Include
- Device model (S25, S25+, S25 Ultra, S25 Edge)
- OneUI version
- Specific packages removed
- Steps to reproduce
- Expected vs actual behavior
- Error messages (if any)

---

## Suggesting Package Removals

### Package Suggestion Template

```markdown
**Package Name:** com.example.packagename

**App Name:** Example App Name

**Category:** [Bloatware / Carrier / Samsung / Google]

**Safety Level:** [Safe / Moderate Risk / High Risk]

**Description:**
What does this package do?

**Testing:**
- Removed on: [Device model]
- Duration tested: [Days/weeks]
- Features tested:
  - [ ] Phone calls
  - [ ] SMS
  - [ ] Camera
  - [ ] Samsung Pay
  - [ ] Other features...

**Impact:**
What happened after removal? Any features broken?

**Recommendation:**
Should this be added to which script?
- [ ] 01-safe-user-apps.txt
- [ ] 02-bloatware-carriers.txt
- [ ] 03-safe-system-apps.txt
- [ ] 04-optional-removals.txt

**Source:**
Where did you find this package info?
```

### Research Requirements

Before suggesting a package:

1. **Test thoroughly** (minimum 3 days)
2. **Document** what breaks (if anything)
3. **Verify** package name is correct
4. **Check** if already in repository
5. **Research** what the package does

### Finding Package Information

```bash
# Get package info
adb shell pm dump PACKAGE_NAME | grep -A 5 "Package "

# Check if package is installed
adb shell pm list packages | grep PACKAGE_NAME

# See package activities
adb shell pm dump PACKAGE_NAME | grep "Activity"
```

---

## Submitting Changes

### Pull Request Process

1. **Fork the repository**
2. **Create a branch** for your changes
   ```bash
   git checkout -b add-new-package
   ```
3. **Make your changes**
4. **Test your changes** thoroughly
5. **Commit with clear message**
   ```bash
   git commit -m "Add com.example.app to safe removals"
   ```
6. **Push to your fork**
   ```bash
   git push origin add-new-package
   ```
7. **Open pull request** with description

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Package addition
- [ ] Package removal
- [ ] Documentation update
- [ ] Bug fix
- [ ] New feature

## Testing
- Device: [Model]
- OneUI: [Version]
- Testing period: [Duration]

## Changes Made
- File: 01-safe-user-apps.txt
  - Added: com.example.app (Example App - safe to remove)

## Verification
- [ ] Tested personally
- [ ] No features broken
- [ ] Package name verified
- [ ] Added to correct category
- [ ] Documentation updated (if needed)

## Additional Notes
Any other relevant information
```

---

## Testing Requirements

### For Package Additions

**Minimum Testing Period:** 3 days

**Required Tests:**
- [ ] Phone calls (incoming and outgoing)
- [ ] SMS (send and receive)
- [ ] Camera (photo and video)
- [ ] WiFi connection
- [ ] Mobile data
- [ ] Bluetooth
- [ ] App installations from Play Store

**Feature-Specific Tests:**
If package relates to specific features:
- Samsung Pay → Test payment
- DEX → Test DEX mode
- Bixby → Test voice commands
- Camera features → Test all modes

### For Script Changes

**Testing Checklist:**
- [ ] Script runs without errors
- [ ] Correct packages removed
- [ ] No critical packages removed
- [ ] Tested on clean device
- [ ] Verified restore procedures work

### Documentation Changes

**Review Checklist:**
- [ ] Spelling and grammar correct
- [ ] Formatting consistent
- [ ] Links work
- [ ] Code examples tested
- [ ] Information accurate and up-to-date

---

## Style Guidelines

### File Naming
- Debloat scripts: `##-descriptive-name.txt` (numbered)
- Documentation: `UPPERCASE-NAME.md`
- Scripts: `lowercase-with-dashes.sh`
- Configs: `descriptive-name.txt`

### Package Lists Format

```bash
# Category Header
# ============================================

# Package description
adb shell pm uninstall --user 0 com.package.name

# Another package
adb shell pm uninstall --user 0 com.another.package
```

### Comments Style

**Good:**
```bash
# Samsung AR Zone (AR features and emoji)
# Safe to remove if you don't use AR
adb shell pm uninstall --user 0 com.samsung.android.arzone
```

**Bad:**
```bash
# Remove this
adb shell pm uninstall --user 0 com.samsung.android.arzone
```

### Markdown Style

**Headers:**
```markdown
# H1 - Document Title
## H2 - Major Sections
### H3 - Subsections
```

**Lists:**
- Use `-` for unordered lists
- Use `1.` for ordered lists
- Use `[ ]` for checkboxes

**Code Blocks:**
- Use triple backticks with language
- Include examples that work copy-paste

**Links:**
- Use relative links for repo files: `[FAQ](FAQ.md)`
- Use full URLs for external links

---

## Community Configurations

Share your tested configurations with others!

### Creating a Community Config

1. **Create file** in `community-configs/` folder
2. **Name descriptively:** `battery-focused-minimal.txt`
3. **Add header** with info:

```markdown
# Battery-Focused Minimal Configuration
# Tested by: [Your GitHub username]
# Device: Galaxy S25 Edge
# OneUI: 8.0
# Date: 2025-10-25
#
# Focus: Maximum battery life, minimal bloat
# Keeps: Samsung ecosystem apps, removes Google/third-party
# Battery improvement: ~15-20%
# Testing period: 2 weeks
#
# Preserved features:
# - Samsung Pay
# - Samsung DEX
# - Bixby Routines
# - All core functions
#
# Removed features:
# - Google apps (except Play Services/Store)
# - AR features
# - Gaming services
# - Social media
```

4. **List packages** (one per line)
5. **Test thoroughly**
6. **Submit pull request**

### Configuration Types Needed

Helpful configurations to create:
- **Privacy-focused** - Minimal tracking/telemetry
- **Performance-focused** - Maximum speed
- **Battery-focused** - Maximum battery life
- **Minimal** - Bare bones, keep only essentials
- **Samsung-heavy** - Keep Samsung, remove Google
- **Google-heavy** - Keep Google, remove Samsung duplicates
- **Business** - Keep productivity, remove entertainment
- **Gaming** - Keep gaming services, remove bloat

---

## Code of Conduct

### Our Standards

**Positive behavior:**
- Be respectful and constructive
- Help others learn
- Accept constructive criticism
- Focus on what's best for the community

**Unacceptable behavior:**
- Harassment or discriminatory language
- Trolling or insulting comments
- Publishing others' private information
- Unconstructive criticism

### Enforcement

Violations may result in:
1. Warning
2. Temporary ban
3. Permanent ban

Report issues to repository maintainers.

---

## Recognition

Contributors will be recognized in:
- README.md contributors section
- CHANGELOG.md for significant contributions
- Community configurations credited to author

---

## Questions?

Not sure about something?

- **Check FAQ.md** first
- **Open a discussion** on GitHub
- **Ask in issue** before submitting PR
- **Read existing pull requests** for examples

---

## License

By contributing, you agree that your contributions will be licensed under the same MIT License that covers this project.

---

## Thank You!

Every contribution helps make this resource better for the entire S25 Edge community. Whether it's fixing a typo or adding a new configuration, your help is appreciated!

---

**Last Updated:** October 2025
