# Debloat Level Comparison

Visual comparison of what each debloat level removes and preserves.

## Quick Comparison Table

| Feature/App | Conservative | Moderate | Aggressive |
|-------------|--------------|----------|------------|
| **Third-Party Bloatware** |
| Facebook | ✅ Remove | ✅ Remove | ✅ Remove |
| Microsoft Office | ✅ Remove | ✅ Remove | ✅ Remove |
| Netflix | ✅ Remove | ✅ Remove | ✅ Remove |
| Amazon Shopping | ✅ Remove | ✅ Remove | ✅ Remove |
| **Carrier Apps** |
| All carriers | ✅ Remove | ✅ Remove | ✅ Remove |
| **Samsung Apps** |
| Samsung Calendar | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Samsung Notes | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Samsung Browser | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Samsung Health | ⚠️ Keep | ⚠️ Keep | ✅ Remove |
| Samsung Pay | ⚠️ Keep | ⚠️ Keep | ✅ Remove |
| Samsung DEX | ⚠️ Keep | ⚠️ Keep | ⚠️ Keep |
| Samsung Keyboard | ⚠️ Keep | ⚠️ Keep | ⚠️ Keep |
| Game Launcher | ✅ Remove | ✅ Remove | ✅ Remove |
| AR Zone | ✅ Remove | ✅ Remove | ✅ Remove |
| TV Plus | ✅ Remove | ✅ Remove | ✅ Remove |
| **Google Apps** |
| YouTube Music | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Google Docs | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Google Photos | ⚠️ Keep | ✅ Remove | ✅ Remove |
| Gmail | ⚠️ Keep | ⚠️ Keep | ✅ Remove |
| Chrome | ⚠️ Keep | ⚠️ Keep | ✅ Remove |
| Google Maps | ⚠️ Keep | ⚠️ Keep | ✅ Remove |
| **AI Assistants** |
| Bixby | ⚠️ Keep | ⚠️ Optional | ✅ Remove |
| Gemini | ⚠️ Keep | ⚠️ Keep | ⚠️ Optional |
| **Features** |
| Circle to Search | ✅ Works | ✅ Works | ✅ Works |
| Live Translation | ✅ Works | ✅ Works | ⚠️ May break |
| Samsung Pay | ✅ Works | ✅ Works | ❌ Removed |
| DEX Mode | ✅ Works | ✅ Works | ✅ Works |
| Knox/Secure Folder | ✅ Works | ✅ Works | ✅ Works |

**Legend:**
- ✅ = Removed/Works
- ⚠️ = Kept/Optional
- ❌ = Broken/Removed

## Package Count Comparison

| Debloat Level | Packages Removed | Scripts Used |
|---------------|------------------|--------------|
| **Conservative** | ~45-60 | 01, 02 |
| **Moderate** | ~80-100 | 01, 02, 03 |
| **Aggressive** | ~120-150 | 01, 02, 03, 04 |

## Feature Impact

### Conservative
**What You Lose:**
- Facebook apps
- Carrier bloatware
- Samsung TV Plus
- Game Launcher (if not gaming)
- AR Zone (if not using AR)

**What You Keep:**
- All core features
- Samsung ecosystem
- Google ecosystem
- Bixby & Gemini
- Samsung Pay, Health, Notes

**Best For:**
- First-time debloaters
- Want maximum compatibility
- Use Samsung features

### Moderate
**What You Lose:**
- Everything from Conservative
- Samsung Calendar, Notes, Browser (use Google alternatives)
- Some Google apps (YouTube Music, Docs, Photos)
- AR features
- Bixby (optional)

**What You Keep:**
- Core device features
- Choice of Samsung OR Google ecosystem
- Samsung Pay, DEX
- Critical services

**Best For:**
- Regular users
- Prefer one ecosystem (Samsung OR Google)
- Want noticeable improvements

### Aggressive
**What You Lose:**
- Almost all Samsung apps
- Most Google apps
- Samsung Pay
- Many integrations

**What You Keep:**
- Phone, SMS, Camera
- Essential system services
- Samsung DEX
- Samsung Keyboard
- Play Store

**Best For:**
- Advanced users
- Minimal phone usage
- Custom app preferences
- Maximum performance/battery

## Expected Improvements

### Battery Life

| Level | Typical Improvement | Screen-on Time Gain |
|-------|---------------------|---------------------|
| Conservative | 5-10% | +30-60 min |
| Moderate | 10-20% | +1-2 hours |
| Aggressive | 15-25% | +1.5-3 hours |

*Varies based on usage patterns*

### RAM Usage

| Level | RAM Freed | Available RAM |
|-------|-----------|---------------|
| Conservative | ~200-300 MB | Better multitasking |
| Moderate | ~400-600 MB | Significantly better |
| Aggressive | ~600-900 MB | Maximum available |

### Storage Space

| Level | Space Freed |
|-------|-------------|
| All levels | 100-500 MB |

*ADB uninstall doesn't free much storage - mainly RAM benefit*

## Compatibility

### Works on All Levels
- Phone calls & SMS
- Camera
- WiFi & Mobile data
- Bluetooth
- Fingerprint/Face unlock
- Apps from Play Store

### May Break (Aggressive)
- Samsung Pay
- Some Samsung integrations
- Live Translation
- Certain Samsung features

### Never Breaks
- Knox security
- Secure Folder
- Core Android functions
- Play Store
- Third-party apps

## Decision Guide

**Choose Conservative if:**
- First time debloating
- Use many Samsung features
- Want maximum safety
- Uncertain what you need

**Choose Moderate if:**
- Experienced with Android
- Prefer Google OR Samsung (not both)
- Want noticeable improvements
- Willing to restore if needed

**Choose Aggressive if:**
- Expert user
- Minimal feature usage
- Want maximum performance
- Understand risks
- Have backup plan

## Reversibility

All levels are reversible:
- Individual packages: `adb shell cmd package install-existing PACKAGE`
- Full restore: Factory reset
- See RESTORE-GUIDE.md for details

## Recommendation by User Type

| User Type | Recommended Level |
|-----------|-------------------|
| Beginner | Conservative |
| Regular user | Moderate |
| Power user | Moderate or Aggressive |
| Developer | Aggressive |
| Samsung ecosystem fan | Conservative |
| Google ecosystem fan | Moderate (remove Samsung duplicates) |
| Minimalist | Aggressive |

---

**Last Updated:** October 2025
