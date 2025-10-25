# T-Mobile USA - S25 Edge Debloat Guide

Specific guide for Samsung Galaxy S25 Edge on T-Mobile network.

## T-Mobile-Specific Bloatware

### T-Mobile Apps (Safe to Remove)

```bash
# T-Mobile services
adb shell pm uninstall --user 0 com.tmobile.pr.adapt
adb shell pm uninstall --user 0 com.tmobile.services.nameid
adb shell pm uninstall --user 0 com.tmobile.echolocate
adb shell pm uninstall --user 0 com.tmobile.pr.mytmobile
adb shell pm uninstall --user 0 com.tmobile.tmoplus
```

## Keep for T-Mobile Features

**Do NOT remove if you use:**
- T-Mobile Tuesdays: Keep `com.tmobile.pr.mytmobile`
- T-Mobile services: May need some packages

## Testing After Removal

Verify these work:
- [ ] Phone calls
- [ ] SMS/MMS (especially RCS)
- [ ] Mobile data (LTE/5G)
- [ ] WiFi Calling
- [ ] Visual Voicemail

## Known Issues

None reported - T-Mobile bloatware removal is very safe.

---

**Last Updated:** October 2025
