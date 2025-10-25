# Package Name: com.example.packagename

## Basic Information

**App Name:** Example App Name
**Package Name:** `com.example.packagename`
**Category:** [Samsung/Google/Carrier/Third-Party]
**Type:** [User App/System App]
**Typical Size:** XX MB

## Description

What this package does and its purpose on the device.

## Safety Rating

- [ ] Safe - No features broken
- [ ] Moderate - Minor features affected
- [ ] Risky - Major features broken
- [ ] Critical - DO NOT REMOVE

## Dependencies

**This package requires:**
- List of packages this needs

**Required by:**
- List of features/apps that need this

## Impact if Removed

**Breaks:**
- Feature 1
- Feature 2

**Still Works:**
- Everything else

**Alternative Apps:**
- Suggested replacement from Play Store

## Removal

**ADB Command:**
```bash
adb shell pm uninstall --user 0 com.example.packagename
```

**Termux:**
```bash
adb shell pm uninstall --user 0 com.example.packagename
```

**Canta:**
Search for "Example App Name" and tap Uninstall

## Restore

**Command:**
```bash
adb shell cmd package install-existing com.example.packagename
```

**Play Store:**
Available: Yes/No
Link: [if available]

## User Reports

**Battery Impact:** Low/Medium/High
**RAM Usage:** XX MB average
**Background Activity:** Yes/No

**Common Issues:**
- Issue 1
- Issue 2

**Tested On:**
- Galaxy S25 Edge - OneUI 8.0 ✓
- Galaxy S25 Ultra - OneUI 8.0 ✓

## Related Packages

- com.related.package1
- com.related.package2

## Additional Notes

Any other relevant information, warnings, or tips.

---

**Last Updated:** YYYY-MM-DD
**Contributor:** [GitHub username]
