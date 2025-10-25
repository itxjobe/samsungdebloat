# Samsung Galaxy Package Reference Guide

Complete reference of Samsung and Google packages with descriptions and safety ratings.

## How to Use This Guide

- **Safety Rating**: LOW = Very safe | MODERATE = Some features affected | HIGH = Core features affected | CRITICAL = May break system
- **Category**: Type of app/service
- **Recommendation**: Whether to keep or remove

---

## Samsung Core Packages (DO NOT REMOVE)

| Package Name | Description | Safety Rating | Recommendation |
|--------------|-------------|---------------|----------------|
| com.samsung.android.honeyboard | Samsung Keyboard | CRITICAL | KEEP - Bootloop with DEX |
| com.android.systemui | System UI | CRITICAL | KEEP - Required for UI |
| com.sec.android.app.launcher | OneUI Launcher | CRITICAL | KEEP unless alternative installed |
| com.samsung.android.knox.* | Knox Security | CRITICAL | KEEP - May lock device |
| com.samsung.android.intelligence.voice | Live Translation | HIGH | KEEP for Galaxy AI |

---

## Bixby Packages

| Package Name | Description | Safety Rating | Recommendation |
|--------------|-------------|---------------|----------------|
| com.samsung.android.bixby.agent | Main Bixby service | LOW | Remove if using Gemini |
| com.samsung.android.bixby.wakeup | "Hi Bixby" detection | LOW | Safe to remove |
| com.samsung.android.bixbyvision.framework | Bixby Vision framework | LOW | Remove if not using |
| com.samsung.android.visionintelligence | Circle to Search & Bixby Vision | MODERATE | Keep for Circle to Search |
| com.samsung.android.app.routines | Bixby Routines (Modes & Routines) | MODERATE | Keep - very useful |
| com.samsung.android.bixby.service | Bixby background service | LOW | Remove with other Bixby |
| com.samsung.android.bixby.ondevice.* | Bixby language packs | LOW | Safe to remove |

---

## Google AI & Assistant Packages

| Package Name | Description | Safety Rating | Recommendation |
|--------------|-------------|---------------|----------------|
| com.google.android.apps.bard | Google Gemini | LOW | Keep for Galaxy AI integration |
| com.google.android.googlequicksearchbox | Google Search | MODERATE | Keep - needed for Gemini, Circle to Search |
| com.google.android.apps.googleassistant | Google Assistant (legacy) | LOW | Remove if using Gemini |
| com.google.ar.core | AR Core services | LOW | Remove if no AR apps |
| com.android.hotwordenrollment.* | "Hey Google" detection | LOW | Safe to remove |

---

## Samsung Apps with Google Alternatives

| Package Name | Description | Safety Rating | Google Alternative |
|--------------|-------------|----------------|-------------------|
| com.samsung.android.calendar | Samsung Calendar | LOW | Google Calendar |
| com.samsung.android.app.notes | Samsung Notes | LOW | Google Keep |
| com.samsung.android.messaging | Samsung Messages | LOW | Google Messages |
| com.sec.android.app.sbrowser | Samsung Internet | LOW | Chrome |
| com.sec.android.app.shealth | Samsung Health | LOW | Google Fit |
| com.sec.android.app.voicenote | Voice Recorder | LOW | Google Recorder |

---

## Samsung Features & Services

| Package Name | Description | Safety Rating | Impact if Removed |
|--------------|-------------|---------------|-------------------|
| com.samsung.android.mdx | Samsung DEX | MODERATE | No DEX mode |
| com.samsung.android.spay | Samsung Pay | MODERATE | No Samsung Pay |
| com.samsung.android.spayfw | Samsung Pay Framework | MODERATE | Related to Samsung Pay |
| com.samsung.android.samsungpass | Samsung Pass | LOW | No password manager |
| com.samsung.android.smartswitchassistant | Smart Switch | LOW | No data transfer tool |
| com.samsung.android.fmm | Find My Mobile | MODERATE | No device tracking |
| com.samsung.android.app.spage | Samsung Free | LOW | No news feed |

---

## Samsung AR & Creative

| Package Name | Description | Safety Rating | Impact if Removed |
|--------------|-------------|---------------|-------------------|
| com.samsung.android.arzone | AR Zone hub | LOW | No AR features |
| com.samsung.android.aremoji | AR Emoji | LOW | No AR Emoji |
| com.samsung.android.aremojieditor | AR Emoji Editor | LOW | No emoji editing |
| com.samsung.android.ardrawing | AR Drawing | LOW | No AR drawing |
| com.samsung.android.app.camera.sticker.* | Camera stickers | LOW | Fewer camera effects |
| com.samsung.android.app.sketchbook | Samsung Sketchbook | LOW | No S Pen sketching app |

---

## Samsung Gaming

| Package Name | Description | Safety Rating | Impact if Removed |
|--------------|-------------|---------------|-------------------|
| com.samsung.android.game.gamehome | Game Launcher | LOW | No game hub |
| com.samsung.android.game.gametools | Game Tools overlay | LOW | No gaming features |
| com.samsung.android.game.gos | Game Optimizing Service | LOW | No game optimization |

---

## Google Apps (Bloatware)

| Package Name | Description | Safety Rating | Can Reinstall |
|--------------|-------------|---------------|---------------|
| com.google.android.youtube | YouTube | LOW | Yes - Play Store |
| com.google.android.apps.youtube.music | YouTube Music | LOW | Yes - Play Store |
| com.google.android.videos | Google TV/Play Movies | LOW | Yes - Play Store |
| com.google.android.apps.docs | Google Docs/Drive | LOW | Yes - Play Store |
| com.google.android.apps.photos | Google Photos | LOW | Yes - Play Store |
| com.google.android.gm | Gmail | LOW | Yes - Play Store |
| com.google.android.apps.tachyon | Google Meet/Duo | LOW | Yes - Play Store |
| com.google.android.apps.maps | Google Maps | LOW | Yes - Play Store |

---

## Third-Party Bloatware

| Package Name | Description | Safety Rating |
|--------------|-------------|---------------|
| com.facebook.katana | Facebook | LOW |
| com.facebook.system | Facebook System | LOW |
| com.facebook.services | Facebook Services | LOW |
| com.facebook.appmanager | Facebook App Manager | LOW |
| com.microsoft.office.outlook | Outlook | LOW |
| com.microsoft.office.officehubrow | Office Hub | LOW |
| com.microsoft.skydrive | OneDrive | LOW |
| com.amazon.mShop.android.shopping | Amazon Shopping | LOW |
| com.booking | Booking.com | LOW |
| com.netflix.mediaclient | Netflix | LOW |
| com.linkedin.android | LinkedIn | LOW |
| com.spotify.music | Spotify | LOW |

All third-party apps can be safely removed and reinstalled from Play Store if needed.

---

## Samsung Kids & Parental

| Package Name | Description | Safety Rating |
|--------------|-------------|---------------|
| com.sec.android.app.kidshome | Samsung Kids | LOW |
| com.samsung.android.kidsinstaller | Kids Installer | LOW |
| com.samsung.android.app.parentalcare | Parental Care | LOW |

---

## Samsung Edge Panels

| Package Name | Description | Safety Rating | Impact if Removed |
|--------------|-------------|---------------|-------------------|
| com.samsung.android.app.clipboardedge | Clipboard Edge Panel | LOW | No clipboard panel |
| com.samsung.android.app.taskedge | Task Edge Panel | LOW | No task switcher panel |

---

## OneUI 8 Specific Packages

| Package Name | Description | Safety Rating | Notes |
|--------------|-------------|---------------|-------|
| com.samsung.android.aicore | Galaxy AI Core | HIGH | Keep for AI features |
| com.samsung.android.visionintelligence | Vision Intelligence | MODERATE | Keep for Circle to Search |
| com.samsung.android.app.interpreter | Interpreter | MODERATE | Live translation |
| com.samsung.android.carkey | Digital Car Key | LOW | Only for select vehicles |
| com.google.audio.hearing.visualization.accessibility.scribe | Live Scribe | LOW | Accessibility feature |

---

## Carrier Apps (Examples)

All carrier apps are safe to remove. Package names vary by carrier:

### Verizon
- com.vzw.apnservice
- com.vzw.ecid
- com.vcast.mediamanager

### AT&T
- com.att.android.attsmartwifi
- com.att.myWireless
- com.att.tv

### T-Mobile
- com.tmobile.pr.adapt
- com.tmobile.pr.mytmobile

### Orange (EU)
- com.orange.appshop
- com.orange.mail.fr
- com.orange.orangeetmoi

See `02-bloatware-carriers.txt` for complete list.

---

## Samsung Background Services

| Package Name | Description | Safety Rating | Notes |
|--------------|-------------|---------------|-------|
| com.samsung.android.app.omcagent | Carrier customization | LOW | Safe to remove |
| com.samsung.android.mdecservice | MDE Service | MODERATE | Knox related |
| com.samsung.android.ipsgeofence | Geofence service | LOW | Location service |
| com.sec.android.daemonapp | Daemon app | MODERATE | Background services |

---

## Google System Services

| Package Name | Description | Safety Rating | Notes |
|--------------|-------------|---------------|-------|
| com.google.android.gms.location.history | Location History | LOW | Privacy concern |
| com.google.android.projection.gearhead | Android Auto | LOW | Remove if not using |
| com.google.android.onetimeinitializer | Setup service | LOW | Remove after setup |
| com.google.android.setupwizard | Setup Wizard | LOW | Remove after setup |

---

## How to Check Package Status

### List all packages (installed)
```bash
adb shell pm list packages
```

### List uninstalled packages for user 0
```bash
adb shell pm list packages -u
```

### Check if specific package exists
```bash
adb shell pm list packages | grep com.samsung.android.bixby
```

### Get package info
```bash
adb shell pm dump com.samsung.android.bixby.agent
```

---

## Restore Commands

### Restore single package
```bash
adb shell cmd package install-existing com.package.name
```

### Restore via factory reset
Factory reset will restore ALL removed packages.

---

## Safety Ratings Explained

- **CRITICAL**: Will break core system functionality or cause bootloop. NEVER remove.
- **HIGH**: Will disable major features like Galaxy AI, DEX, or Knox services.
- **MODERATE**: Will affect some Samsung/Google integrations but phone still functional.
- **LOW**: Minimal impact, mostly user apps or optional features.

---

## Dependencies to Remember

### For Gemini to work:
- com.google.android.apps.bard
- com.google.android.googlequicksearchbox
- com.google.android.gms (Google Play Services)

### For Bixby to work:
- com.samsung.android.bixby.agent
- com.samsung.android.bixby.wakeup (optional)
- com.samsung.android.visionintelligence (for Bixby Vision)

### For Circle to Search:
- com.samsung.android.visionintelligence OR
- com.google.android.googlequicksearchbox

### For Live Translation:
- com.samsung.android.app.interpreter
- com.samsung.android.intelligence.voice (DO NOT REMOVE)
- Language packs

### For Samsung DEX:
- com.samsung.android.mdx
- com.samsung.android.honeyboard (Samsung Keyboard)

### For Galaxy AI features:
- com.samsung.android.aicore
- com.google.android.apps.bard (Gemini)
- com.samsung.android.intelligence.voice

---

**Last Updated**: October 2025 for OneUI 8
