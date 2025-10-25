# OneUI Feature Toggles Without Removing Apps

Disable features and reduce bloat without actually uninstalling packages.

## Settings-Based Toggles

### Disable Animations

**Effect:** Faster UI, feels snappier, better battery

**Settings:**
1. Settings > Developer options > Window animation scale > 0.5x or Off
2. Settings > Developer options > Transition animation scale > 0.5x or Off
3. Settings > Developer options > Animator duration scale > 0.5x or Off

**ADB Method:**
```bash
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5

# Or completely off:
adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
```

### Disable Background Services

**Limit background process:**
```bash
adb shell settings put global background_process_limit 2
```

### Disable Telemetry

**Settings:**
1. Settings > Privacy > Customization Service > Off
2. Settings > Google > Ads > Opt out of Ads Personalization
3. Settings > Google > Usage & diagnostics > Off

**ADB Method:**
```bash
# Disable Samsung diagnostics
adb shell pm disable-user com.samsung.android.lool

# Disable Google usage stats
adb shell pm disable-user com.google.android.gms.feedback
```

## ADB Feature Toggles

### Disable Apps Without Removing

**Syntax:**
```bash
adb shell pm disable-user PACKAGE_NAME
```

**Re-enable:**
```bash
adb shell pm enable PACKAGE_NAME
```

**Examples:**
```bash
# Disable Game Launcher (can re-enable easily)
adb shell pm disable-user com.samsung.android.game.gamehome

# Disable Bixby temporarily
adb shell pm disable-user com.samsung.android.bixby.agent
```

### Disable Startup Services

**Reduce boot time:**
```bash
# Disable Samsung Cloud sync on startup
adb shell pm disable-user com.samsung.android.scloud

# Disable Samsung Marketing (analytics)
adb shell pm disable-user com.samsung.android.SettingsReceiver
```

## Per-App Settings

### Battery Optimization

**Put apps to deep sleep:**
1. Settings > Battery > Background usage limits
2. Add apps to "Deep sleeping apps"

**ADB Method:**
```bash
# Put app in standby (reduces background usage)
adb shell am set-inactive PACKAGE_NAME true
```

### Disable App Notifications

**Bulk disable:**
1. Settings > Notifications
2. Disable for unused apps

### Revoke Permissions

**Remove unnecessary permissions:**
1. Settings > Privacy > Permission manager
2. Review and revoke

**ADB Method:**
```bash
# Revoke location for specific app
adb shell pm revoke PACKAGE_NAME android.permission.ACCESS_FINE_LOCATION
```

## Network Optimizations

### Private DNS (Ad Blocking)

**Settings:**
1. Settings > Connections > More connection settings > Private DNS
2. Enter: `dns.adguard.com`

**Effect:** System-wide ad blocking without root

**Alternatives:**
- `family.cloudflare-dns.com` - Family-safe DNS
- `1.1.1.1` - Cloudflare (fast, no filtering)

### Disable 5G (Battery Saving)

**Settings:**
1. Settings > Connections > Mobile networks
2. Network mode > LTE only

**Effect:** Better battery if 5G signal is weak

## Display Optimizations

### Reduce Refresh Rate

**Settings:**
1. Settings > Display > Motion smoothness
2. Select "Standard" (60Hz) instead of "Adaptive" (120Hz)

**Effect:** Significant battery improvement

### Reduce Resolution

**ADB Only (root usually required):**
```bash
# Set to FHD+ instead of WQHD+
adb shell wm size 1080x2400
adb shell wm density 480
```

## Restore Defaults

**Reset all toggles:**
```bash
# Reset animations
adb shell settings delete global window_animation_scale
adb shell settings delete global transition_animation_scale
adb shell settings delete global animator_duration_scale

# Reset background limit
adb shell settings delete global background_process_limit

# Re-enable all apps
adb shell pm list packages -d | sed 's/package://g' | xargs -n 1 adb shell pm enable
```

## Comparison: Disable vs Uninstall

| Action | Disable | Uninstall (ADB) |
|--------|---------|-----------------|
| Frees storage | No | No (only user data) |
| Frees RAM | Yes | Yes |
| Stops background | Yes | Yes |
| Easily reversible | Very easy | Easy |
| Survives update | Yes | Yes |
| Survives reset | Yes | No (apps return) |

## Recommended Approach

1. **Start with toggles** (Settings changes)
2. **Try disabling** apps you might want back
3. **Then uninstall** apps you're certain about
4. **Keep notes** of what you changed

## Safety

All these toggles are:
- ✓ Completely reversible
- ✓ No risk of bootloop
- ✓ Can be reset to default
- ✓ Safe to experiment

---

**Last Updated:** October 2025
