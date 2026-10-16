# Post-Update Guide

What to do after OneUI software updates to maintain your debloated setup.

## Updating to OneUI 9 (from OneUI 8 or 8.5)

OneUI 9 moves to Android 17 and changes some packages. After the update:

1. **Save a fresh package list** and compare it with your pre-update list (commands below).
2. **Re-check Now Brief.** It lives in `com.samsung.android.smartsuggestions`. Older versions of the S26 preset removed it; since 1.3.0 it is optional. Restore it with `adb shell cmd package install-existing com.samsung.android.smartsuggestions` if you want it back.
3. **Keep the new Galaxy AI packages**: `intellivoiceservice`, `offline.languagemodel`, `vision.model`, `scs`, `visual.cloudcore`. See the KEEP section of `08-z-fold8.txt`.
4. **Expect "not installed" messages** for packages that no longer exist, such as `bixby.service`, `bixby.voiceinput` and `bixbyvision.framework`. They are harmless.
5. **Foldables**: keep `aodservice` and `dressroom`, which drive the cover screen widgets and wallpaper.


## After Major Updates (OneUI 8.0 → 8.1, etc.)

### Step 1: Check for New Bloatware

```bash
# List all installed packages
adb shell pm list packages > packages-after-update.txt

# Compare with previous list (if you saved it)
diff packages-before-update.txt packages-after-update.txt
```

### Step 2: Review Removed Packages

Good news: **Removed packages stay removed** after updates.

Updates won't restore apps you removed, but may add new bloatware.

### Step 3: Look for New Packages

Search for common bloatware patterns:
```bash
adb shell pm list packages | grep -i facebook
adb shell pm list packages | grep -i game
adb shell pm list packages | grep -i tvplus
```

### Step 4: Remove New Bloatware

If new bloatware appeared:
1. Identify package name
2. Check if it's in our scripts
3. Remove using ADB
4. Update your documentation

---

## After Minor Updates (Security Patches)

Usually safe - minor updates rarely add apps.

**Quick check:**
```bash
adb shell pm list packages | wc -l
```

Compare count with previous. Significant increase = new apps.

---

## Testing After Update

### Critical Features Checklist

After any update, test:

- [ ] Phone calls
- [ ] SMS/MMS
- [ ] Camera
- [ ] Samsung Pay (if you use it)
- [ ] DEX (if you use it)
- [ ] Bixby/Gemini (if kept)
- [ ] Circle to Search
- [ ] Fingerprint unlock
- [ ] Face unlock

### If Something Broke

1. Check CHANGELOG.md for update notes
2. Review what you removed
3. Restore specific packages (see RESTORE-GUIDE.md)
4. Report issue on GitHub

---

## Recommended Workflow

### Before Update

```bash
# Save current package list
adb shell pm list packages > pre-update-packages.txt

# Note what you removed (if you didn't track it)
# Compare with a stock list for your device (see 07-s26-ultra.txt or 08-z-fold8.txt)
```

### After Update

```bash
# Save new package list
adb shell pm list packages > post-update-packages.txt

# Find new packages
comm -13 pre-update-packages.txt post-update-packages.txt
```

### Remove New Bloatware

Run appropriate scripts again, or remove individual packages.

---

**Last Updated:** October 2026
