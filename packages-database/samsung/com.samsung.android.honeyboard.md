# Package Name: com.samsung.android.honeyboard

## Basic Information

**App Name:** Samsung Keyboard
**Package Name:** `com.samsung.android.honeyboard`
**Category:** Samsung
**Type:** System App
**Typical Size:** 80-120 MB

## Description

Samsung's default keyboard app. Provides typing functionality, autocorrect, swipe gestures, and voice input. Integrated with Samsung DEX and other Samsung features.

## Safety Rating

- [ ] Safe - No features broken
- [ ] Moderate - Minor features affected
- [ ] Risky - Major features broken
- [x] Critical - DO NOT REMOVE (if using DEX)

## Dependencies

**This package requires:**
- System input method framework

**Required by:**
- Samsung DEX (CRITICAL)
- Default typing functionality
- Samsung features requiring text input

## Impact if Removed

**Breaks:**
- **BOOTLOOP if using Samsung DEX** (most serious issue)
- Default keyboard functionality
- Samsung-specific keyboard features
- Voice input integration

**Still Works:**
- Everything else (if alternative keyboard installed)

**Alternative Apps:**
- Gboard (Google Keyboard)
- SwiftKey
- Any third-party keyboard

**CRITICAL WARNING:**
**NEVER remove Samsung Keyboard if you use Samsung DEX. This will cause a bootloop requiring factory reset.**

## Removal

**Only remove if:**
1. You have installed alternative keyboard first
2. You have set alternative as default
3. You DO NOT use Samsung DEX
4. You have tested alternative keyboard works

**ADB Command:**
```bash
# Install alternative first!
# Then:
adb shell pm uninstall --user 0 com.samsung.android.honeyboard
```

**NOT included in any default scripts** - too risky

## Restore

**If you get bootloop:**
1. Boot into Safe Mode
2. Connect ADB
3. Run restore command:

```bash
adb shell cmd package install-existing com.samsung.android.honeyboard
```

4. Reboot normally

**Play Store:**
Available: No (system app only)

## User Reports

**Battery Impact:** Low
**RAM Usage:** 40-60 MB
**Background Activity:** Minimal

**Common Issues:**
- **BOOTLOOP** if removed while using DEX
- Loss of Samsung-specific features
- Some apps may not work with third-party keyboards

**Tested On:**
- Galaxy S25 Edge - OneUI 8.0 - DEX bootloop confirmed
- Galaxy S25 Ultra - OneUI 8.0 - Same issue

## Related Packages

- com.samsung.android.mdx (Samsung DEX - depends on this)
- System input method services

## Additional Notes

**THIS IS THE MOST DANGEROUS PACKAGE TO REMOVE.**

If you use Samsung DEX even occasionally, DO NOT remove this package. The bootloop it causes is difficult to fix without factory reset.

If you don't use DEX and want a different keyboard:
1. Install Gboard or alternative
2. Set as default in Settings > General management > Keyboard
3. Test thoroughly (24 hours minimum)
4. Then remove Samsung Keyboard

Always have a recovery plan ready.

**Recommendation:** KEEP unless you're absolutely certain you don't need it.

---

**Last Updated:** 2025-10-25
**Contributor:** Community tested (bootloop confirmed)
