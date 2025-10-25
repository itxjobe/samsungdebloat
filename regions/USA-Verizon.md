# Verizon USA - S25 Edge Debloat Guide

Specific guide for Samsung Galaxy S25 Edge on Verizon network.

## Verizon-Specific Bloatware

### Verizon Apps (Safe to Remove)

```bash
# Verizon services
adb shell pm uninstall --user 0 com.vzw.apnservice
adb shell pm uninstall --user 0 com.vzw.ecid
adb shell pm uninstall --user 0 com.vcast.mediamanager
adb shell pm uninstall --user 0 com.asurion.android.verizon.vms
adb shell pm uninstall --user 0 com.verizon.llkagent
adb shell pm uninstall --user 0 com.verizon.services
adb shell pm uninstall --user 0 com.verizon.mips.services
adb shell pm uninstall --user 0 com.verizon.obdm
adb shell pm uninstall --user 0 com.motricity.verizon.ssodownloadable

# Verizon Messages/Cloud
adb shell pm uninstall --user 0 com.verizon.messaging.vzmsgs
adb shell pm uninstall --user 0 com.verizon.cloud
```

## Keep for Verizon Features

**Do NOT remove if you use:**
- Verizon WiFi Calling: Keep `com.vzw.apnservice`
- Verizon Visual Voicemail: Keep related packages

## Testing After Removal

Verify these work:
- [ ] Phone calls
- [ ] SMS/MMS
- [ ] Mobile data (LTE/5G)
- [ ] WiFi Calling (if you use it)
- [ ] Visual Voicemail (if you use it)

## Known Issues

None reported - Verizon bloatware removal is very safe.

---

**Last Updated:** October 2025
