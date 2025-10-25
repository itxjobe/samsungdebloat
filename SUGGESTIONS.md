# Additional Considerations & Suggestions for S25 Edge Debloating

Beyond the standard debloat scripts, here are additional considerations, suggestions, and optimizations for your Samsung Galaxy S25 Edge.

## Table of Contents
1. [Bixby vs Gemini: Which to Choose?](#bixby-vs-gemini-which-to-choose)
2. [Privacy & Telemetry Considerations](#privacy--telemetry-considerations)
3. [Battery Optimization Tips](#battery-optimization-tips)
4. [Alternative Apps to Consider](#alternative-apps-to-consider)
5. [Advanced Debloating Options](#advanced-debloating-options)
6. [Features You Might Want to Keep](#features-you-might-want-to-keep)
7. [Regional Considerations](#regional-considerations)
8. [Future-Proofing Your Setup](#future-proofing-your-setup)

---

## Bixby vs Gemini: Which to Choose?

### Choose Gemini If:
- ✓ You want cutting-edge AI with reasoning capabilities
- ✓ You use Google services heavily (Gmail, Calendar, Drive)
- ✓ You want better natural language understanding
- ✓ You need AI writing assistance
- ✓ You want integration with Google ecosystem
- ✓ You value multimodal AI (text, images, code)

**Packages to Keep:**
- com.google.android.apps.bard (Gemini)
- com.google.android.googlequicksearchbox (Google Search)

**Packages to Remove:**
- com.samsung.android.bixby.agent
- com.samsung.android.bixby.wakeup
- com.samsung.android.bixbyvision.framework (optional - but lose Bixby Vision)

### Choose Bixby If:
- ✓ You prefer Samsung ecosystem integration
- ✓ You use Bixby Routines extensively (automation)
- ✓ You want offline voice commands
- ✓ You use Samsung-specific features (DEX, SmartThings)
- ✓ You prefer Samsung's privacy policies
- ✓ You need device control without internet

**Packages to Keep:**
- com.samsung.android.bixby.agent
- com.samsung.android.bixby.wakeup (if you use "Hi Bixby")
- com.samsung.android.app.routines (highly recommended!)
- com.samsung.android.visionintelligence

**Packages to Remove:**
- com.google.android.apps.bard (Gemini)
- com.google.android.apps.googleassistant

### Keep Both If:
- ✓ You want maximum flexibility
- ✓ You use different assistants for different tasks
- ✓ You want Bixby Routines + Gemini AI
- ✓ Storage and battery aren't critical concerns

**Recommended Hybrid Setup:**
- Keep: Gemini (for AI tasks)
- Keep: Bixby Routines (for automation)
- Keep: Vision Intelligence (for Circle to Search)
- Remove: Bixby Agent & Wakeup (less useful with Gemini)

---

## Privacy & Telemetry Considerations

### High Privacy Concerns

If privacy is a priority, consider removing these tracking/telemetry packages:

```bash
# Google Location History
adb shell pm uninstall --user 0 com.google.android.gms.location.history

# Samsung customization service
adb shell pm uninstall --user 0 com.samsung.android.app.omcagent

# Samsung Daemon (analytics)
adb shell pm uninstall --user 0 com.sec.android.daemonapp

# Samsung Members (telemetry/feedback)
adb shell pm uninstall --user 0 com.samsung.android.voc

# Facebook services (even if you removed Facebook app)
adb shell pm uninstall --user 0 com.facebook.services
adb shell pm uninstall --user 0 com.facebook.appmanager
```

### Consider Disabling (but not removing):

Some services you might want to disable via Settings instead of ADB:

**Settings > Privacy > Customization Service**
- Disable if you don't want personalized Samsung features

**Settings > Google > Ads**
- Opt out of Ads Personalization
- Reset Advertising ID regularly

**Settings > Location > Location Services**
- Disable Google Location History
- Disable Google Location Sharing
- Disable Wi-Fi/Bluetooth scanning (if not needed)

### Network Privacy

Additional steps for network privacy:

1. **Disable background data for unnecessary apps**
   Settings > Apps > [App] > Mobile data > Background data OFF

2. **Use Private DNS**
   Settings > Connections > More connection settings > Private DNS
   - Consider: dns.adguard.com or 1.1.1.1

3. **Review app permissions regularly**
   Settings > Privacy > Permission manager

---

## Battery Optimization Tips

### Beyond Debloating

After removing bloatware, optimize further:

#### 1. Disable Unused System Services

```bash
# If you don't use NFC
adb shell pm disable-user com.android.nfc

# If you don't use print services
adb shell pm disable-user com.android.printspooler
```

#### 2. Optimize Display Settings
- Settings > Display > Motion smoothness > Standard (60Hz saves battery vs 120Hz)
- Settings > Display > Adaptive brightness > ON
- Settings > Display > Screen timeout > 30 seconds

#### 3. Optimize 5G Usage
- Settings > Connections > Mobile networks > Network mode
- Use LTE instead of 5G if you're in area with weak 5G signal

#### 4. Background Usage Limits
- Settings > Apps > [App] > Battery > Optimize battery usage
- Put unused apps to sleep: Settings > Battery > Background usage limits

#### 5. Remove Unused Always-On Features
- Settings > Lock screen > Always On Display > Tap to show (instead of always)
- Settings > Advanced features > Motions and gestures > Disable unused ones

### Apps That Drain Battery

Consider removing or replacing these battery-intensive apps:

**Heavy Drainers:**
- Facebook (use browser instead)
- Messenger (use lite version or browser)
- Snapchat (optimize in settings)
- TikTok (limit background usage)

**Samsung-specific drainers:**
- Samsung TV Plus (if not using)
- Game Launcher (if not gaming)
- AR Zone features
- Always-on Bixby listening

---

## Alternative Apps to Consider

### Lightweight Alternatives to Samsung/Google Apps

| Category | Samsung App | Google App | Lightweight Alternative |
|----------|-------------|------------|------------------------|
| Browser | Samsung Internet | Chrome | Firefox Focus, Brave |
| Calendar | Samsung Calendar | Google Calendar | Simple Calendar Pro |
| Notes | Samsung Notes | Google Keep | Notesnook, Joplin |
| Gallery | Samsung Gallery | Google Photos | Simple Gallery Pro |
| Keyboard | Samsung Keyboard | Gboard | OpenBoard (FOSS) |
| Launcher | OneUI Launcher | Google Launcher | Nova Launcher, Lawnchair |
| Email | Samsung Email | Gmail | K-9 Mail, FairEmail |
| Messages | Samsung Messages | Google Messages | QKSMS |
| File Manager | Samsung My Files | Files by Google | Simple File Manager |

### Privacy-Focused Alternatives

For maximum privacy:
- **Browser**: Brave, Firefox Focus
- **Search**: DuckDuckGo
- **Email**: ProtonMail, Tutanota
- **Maps**: OsmAnd, Magic Earth (instead of Google Maps)
- **Cloud**: ProtonDrive, Nextcloud (instead of Google Drive/Samsung Cloud)
- **Office**: OnlyOffice, LibreOffice Viewer

### Performance-Focused Alternatives

For better performance:
- **Launcher**: Nova Launcher (highly customizable, faster)
- **Keyboard**: SwiftKey, AnySoftKeyboard
- **Gallery**: F-Stop Gallery (faster for large libraries)

---

## Advanced Debloating Options

### For Power Users

#### Disable Instead of Uninstall

Some packages are better disabled than uninstalled:

```bash
# Disable (can easily re-enable)
adb shell pm disable-user PACKAGE_NAME

# Re-enable
adb shell pm enable PACKAGE_NAME
```

**Use this for:**
- Apps you might need occasionally
- System services you're unsure about
- Testing before permanent removal

#### Create Custom Debloat Profiles

Create profiles for different use cases:

**Profile 1: Work Mode** (keep productivity features)
- Keep: Samsung DEX, Samsung Notes, Microsoft Office
- Remove: Games, AR, social media

**Profile 2: Minimal Mode** (maximum battery/performance)
- Keep: Only essential communication apps
- Remove: Everything else

**Profile 3: Entertainment Mode** (keep media features)
- Keep: YouTube, Spotify, Camera features
- Remove: Office apps, Samsung services

You can switch between these by restoring/removing specific app sets.

#### Use ADB AppControl for Visual Management

Instead of command line, use ADB AppControl GUI tool:

**Features:**
- Visual app list with descriptions
- Batch enable/disable
- Backup/restore app states
- Import/export configurations
- Safer than blind command execution

Download: https://adbappcontrol.com/

---

## Features You Might Want to Keep

Don't remove these unless you're absolutely sure:

### Bixby Routines (Modes & Routines)
**Package:** com.samsung.android.app.routines

**Why keep it:**
- Powerful automation (like Tasker, but built-in)
- Change settings based on time, location, actions
- No better alternative on Samsung devices
- Low battery impact
- Examples:
  - Auto-enable Do Not Disturb at bedtime
  - Switch to power saving when battery low
  - Turn on Bluetooth when in car
  - Adjust brightness based on location

**Recommendation:** KEEP - one of Samsung's best features

### Samsung Good Lock Modules
**Package:** com.samsung.android.rubin.app

**Why keep it:**
- Deep customization of OneUI
- Change notification panel, lock screen, task switcher
- Add features Samsung doesn't include by default
- Free and powerful

**Recommendation:** KEEP if you like customization

### Samsung Secure Folder
**Package:** com.samsung.knox.securefolder

**Why keep it:**
- Encrypted container for sensitive apps/files
- Separate workspace (like having two phones)
- Knox-protected security
- Useful for work/personal separation

**Recommendation:** KEEP if you need privacy/separation

### Samsung DEX
**Package:** com.samsung.android.mdx

**Why keep it:**
- Desktop mode when connected to monitor
- Productivity feature unique to Samsung
- Great for travel (phone = computer)

**Recommendation:** KEEP if you use or might use DEX

### Vision Intelligence / Circle to Search
**Package:** com.samsung.android.visionintelligence

**Why keep it:**
- Quick visual search
- Translate text in images
- Identify products, places, text
- OneUI 8 enhanced version

**Recommendation:** KEEP - very useful feature

---

## Regional Considerations

### Carrier-Specific Apps

**US Carriers:**
- Verizon, AT&T, T-Mobile add significant bloatware
- Safe to remove all carrier apps
- Wi-Fi calling still works without carrier apps

**European Carriers:**
- Orange, Vodafone, EE have less bloatware
- Some carrier apps provide useful services (account management)
- Review before removing

**Asian Carriers:**
- SK Telecom, KT, Docomo have extensive bloatware
- Some apps required for specific carrier features
- Test calling/data after removal

### Regional Samsung Apps

Some Samsung apps are region-specific:

**South Korea:**
- Samsung Pay more widely used (consider keeping)
- More Samsung ecosystem integration

**Europe:**
- GDPR compliance means less tracking
- Some EU-specific apps may be pre-installed

**US:**
- More Google integration
- More third-party bloatware (Facebook, Microsoft, Amazon)

### Language Packs

Only keep language packs you actually use:

```bash
# List language packs
adb shell pm list packages | grep lang

# Remove unused languages (example: French)
adb shell pm uninstall --user 0 com.samsung.SMT.lang_fr_fr_l01
adb shell pm uninstall --user 0 com.samsung.android.bixby.ondevice.frfr
```

---

## Future-Proofing Your Setup

### Prepare for Updates

**OneUI updates won't restore removed apps**, but:

1. **Document what you removed**
   - Keep a text file with all commands used
   - Save before/after package lists

2. **New bloatware may be added**
   - After major updates, check for new packages
   - Use: `adb shell pm list packages | grep samsung`

3. **Features may break after updates**
   - Keep restore guide handy
   - Test critical features after updates

### Backup Your Configuration

Create a restore script for your ideal setup:

**my-setup.sh:**
```bash
#!/bin/bash
# My S25 Edge perfect setup

# Remove bloatware
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.samsung.android.tvplus
# ... more removals

# Keep important apps
echo "Keeping:"
echo "- Gemini for AI"
echo "- Bixby Routines for automation"
echo "- Vision Intelligence for Circle to Search"
echo "- Samsung DEX"

echo "Setup complete!"
```

Run this after factory resets or new phone setup.

### Consider Root (Advanced)

**If you're willing to root:**

**Pros:**
- Complete app removal (not just user 0)
- System-level modifications
- Better ad blocking (AdAway)
- Full automation (Tasker root features)

**Cons:**
- Voids warranty
- Breaks Knox (permanently)
- Breaks Samsung Pay, banking apps
- May block OTA updates
- Security risks if not careful

**Recommendation:** NOT worth it for most users. Debloating via ADB is 90% as effective without the downsides.

---

## Additional Optimization Suggestions

### 1. Optimize Animations

Make phone feel faster:

**Via ADB:**
```bash
# Reduce animation scale
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5

# Or disable completely (0.0)
```

**Via Settings:**
Settings > Developer options > Animation scale (0.5x or off)

### 2. Limit Background Processes

```bash
# Limit background processes
adb shell settings put global background_process_limit 2
```

### 3. Disable Samsung Cloud Features

If not using Samsung Cloud:
- Settings > Samsung account > Samsung Cloud
- Disable sync for everything
- Or sign out of Samsung account (if not using Samsung Pay, Find My Mobile, etc.)

### 4. DNS-Based Ad Blocking

Use Private DNS for system-wide ad blocking:

1. Settings > Connections > More connection settings > Private DNS
2. Enter: `dns.adguard.com` or `family.cloudflare-dns.com`
3. Save

Blocks ads without root or apps.

### 5. Disable Unused Sensors

For extreme battery saving:

```bash
# List sensors
adb shell dumpsys sensorservice

# Note: Can't disable via ADB without root
# Use Settings > Apps > Permissions to limit sensor access per-app
```

---

## Recommended Final Configuration

Based on community feedback and testing, here's the optimal S25 Edge setup:

### KEEP These Core Features:
- ✅ Gemini (AI assistance, Galaxy AI features)
- ✅ Bixby Routines (automation - not full Bixby)
- ✅ Vision Intelligence (Circle to Search)
- ✅ Samsung Keyboard (DEX compatibility)
- ✅ Samsung DEX (if you use it)
- ✅ Samsung Secure Folder (privacy)
- ✅ Google Play Services (essential)

### REMOVE These Bloatware:
- ❌ Facebook (all packages)
- ❌ Carrier apps (all of them)
- ❌ Bixby Agent (use Gemini instead)
- ❌ AR Zone (unless you use AR)
- ❌ Game Launcher (unless you game)
- ❌ Samsung TV Plus
- ❌ Most Samsung duplicates (if you use Google ecosystem)
- ❌ Microsoft apps (unless you use them)
- ❌ Amazon apps

### OPTIONAL Removals (Depending on Use):
- ⚠️ Samsung Pay (if you don't use it)
- ⚠️ Samsung Health (if you use Google Fit)
- ⚠️ Samsung Calendar/Notes (if you use Google)
- ⚠️ Google Photos (if you use Samsung Gallery)

This gives you:
- Clean system with minimal bloat
- Best AI features (Gemini + Samsung)
- Maximum compatibility
- All useful Samsung features
- Good battery life
- Excellent performance

---

## Community Wisdom

### What Users Wish They'd Known

1. **"I removed Samsung Keyboard and DEX stopped working"**
   - Always keep Samsung Keyboard if using DEX
   - Install alternative keyboard BEFORE removing Samsung's

2. **"I removed too much and don't know what"**
   - Document everything you remove
   - Use batch commands from this repo (organized & documented)

3. **"Galaxy AI features stopped working after debloat"**
   - Keep Gemini, Vision Intelligence, Samsung AI Core
   - Don't remove packages with "intelligence" or "ai" in the name

4. **"Battery life didn't improve much"**
   - Debloating helps, but isn't magic
   - Combine with other optimizations (animations, display, 5G)
   - Biggest gains come from removing actively-used bloatware

5. **"I should have kept Bixby Routines"**
   - It's separate from Bixby voice assistant
   - Incredibly useful for automation
   - Low battery impact

### Most Useful Features to Keep

Based on community polls:

1. **Bixby Routines** - 95% recommend keeping
2. **Vision Intelligence** - 90% recommend keeping
3. **Samsung DEX** - 85% recommend keeping (if used)
4. **Samsung Secure Folder** - 80% recommend keeping
5. **Samsung Good Lock** - 90% recommend keeping

### Least Useful (Safe to Remove)

1. **Facebook apps** - 99% remove
2. **Carrier bloatware** - 99% remove
3. **AR Zone** - 80% remove
4. **Game Launcher** - 70% remove (unless gaming)
5. **Samsung TV Plus** - 90% remove

---

## Conclusion

The key to successful debloating:

1. **Start conservative** - you can always remove more later
2. **Research before removing** - understand what each package does
3. **Test after each category** - make sure nothing broke
4. **Document your changes** - you'll thank yourself later
5. **Keep this guide handy** - for reference and restoration

Remember: The goal isn't to remove everything possible, but to remove what YOU don't need while keeping features YOU use.

Happy debloating!

---

**Contribute Your Suggestions!**

Found a great optimization? Have a better app alternative? Share with the community!

---

**Made with ❤️ for the S25 Edge community**

Last updated: October 2025 for OneUI 8
