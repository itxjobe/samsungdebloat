# European Union - S25 Edge Debloat Guide

General guide for Samsung Galaxy S25 Edge purchased in EU countries.

## EU-Specific Considerations

### Less Bloatware

EU models typically have:
- **Less pre-installed bloatware** (GDPR compliance)
- **Fewer third-party apps**
- **More user control**

### EU-Specific Packages

Some packages may be EU-specific for compliance:
- GDPR-related services
- EU warranty services

## Common EU Carrier Bloatware

### Orange (France)
```bash
adb shell pm uninstall --user 0 com.orange.appshop
adb shell pm uninstall --user 0 com.orange.mail.fr
adb shell pm uninstall --user 0 com.orange.orangeetmoi
```

### Vodafone (Multi-country)
```bash
adb shell pm uninstall --user 0 com.vodafone.mcare.client
adb shell pm uninstall --user 0 com.vodafone.myvodafone
```

### O2 (Germany, UK)
```bash
adb shell pm uninstall --user 0 de.o2.android.mein.o2
```

## GDPR Compliance

Even after debloating:
1. Settings > Privacy > Customization Service - Disable
2. Settings > Google > Ads - Opt out
3. Review app permissions regularly

## Testing After Removal

- [ ] Phone calls
- [ ] SMS
- [ ] Mobile data (4G/5G)
- [ ] WiFi Calling (if available)
- [ ] Carrier-specific features

---

**Last Updated:** October 2025
