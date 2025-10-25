# Package Name: com.samsung.android.tvplus

## Basic Information

**App Name:** Samsung TV Plus
**Package Name:** `com.samsung.android.tvplus`
**Category:** Samsung
**Type:** User App
**Typical Size:** 45-60 MB

## Description

Samsung TV Plus is a free ad-supported streaming service providing live TV channels and on-demand content. Pre-installed on Samsung devices but not required for core functionality.

## Safety Rating

- [x] Safe - No features broken
- [ ] Moderate - Minor features affected
- [ ] Risky - Major features broken
- [ ] Critical - DO NOT REMOVE

## Dependencies

**This package requires:**
- None (standalone app)

**Required by:**
- None (optional service)

## Impact if Removed

**Breaks:**
- Samsung TV Plus streaming service only
- Nothing else affected

**Still Works:**
- All other device features
- Other video streaming apps
- Samsung Pay, DEX, Camera, etc.

**Alternative Apps:**
- YouTube
- Netflix
- Any streaming service from Play Store

## Removal

**ADB Command:**
```bash
adb shell pm uninstall --user 0 com.samsung.android.tvplus
```

**Included in Scripts:**
- 01-safe-user-apps.txt ✓
- Conservative batch ✓
- Canta lists ✓

## Restore

**Command:**
```bash
adb shell cmd package install-existing com.samsung.android.tvplus
```

**Play Store:**
Available: Yes
Link: https://play.google.com/store/apps/details?id=com.samsung.android.tvplus

## User Reports

**Battery Impact:** Medium (if used frequently)
**RAM Usage:** 120-150 MB when running
**Background Activity:** Yes (content updates)

**Common Issues:**
- None reported from removal
- Very safe to remove

**Tested On:**
- Galaxy S25 Edge - OneUI 8.0 ✓
- Galaxy S25 Ultra - OneUI 8.0 ✓
- Galaxy S25+ - OneUI 8.0 ✓

## Related Packages

- com.samsung.android.tvplus (standalone)
- No dependencies

## Additional Notes

One of the safest packages to remove. Samsung TV Plus is purely optional entertainment. Removal has no impact on device functionality. Can be reinstalled from Play Store if needed later.

Recommended for all debloat levels.

---

**Last Updated:** 2025-10-25
**Contributor:** Community tested
