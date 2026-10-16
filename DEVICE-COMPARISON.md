# Device Comparison Guide

Differences between Samsung Galaxy S25, S26 and Z Fold 8 models and debloating considerations.

## S25 Series Models

| Model | Screen | Battery | S Pen | Cameras | Unique Features |
|-------|--------|---------|-------|---------|----------------|
| **S25** | 6.2" | 4000mAh | No | Triple | Standard flagship |
| **S25+** | 6.7" | 4900mAh | No | Triple | Larger screen/battery |
| **S25 Edge** | 6.9" | 5000mAh | No | Quad | Curved edge display |
| **S25 Ultra** | 6.8" | 5000mAh | Yes | Quad | S Pen, premium |

---

## Galaxy S26 Series

The Galaxy S26 Ultra (model SM-S948) launched in March 2026 on Snapdragon 8 Elite Gen 5. It ships with **OneUI 8.5 (Android 16)**, the same Android base as the S25 series with a refreshed feature set. It keeps the S Pen, so the S Pen package notes below apply to it as well.

| Model | OS out of box | S Pen | SoC |
|-------|---------------|-------|-----|
| **S26 Ultra** | OneUI 8.5 / Android 16 | Yes | Snapdragon 8 Elite Gen 5 |

### Debloating the S26 Ultra

- The main `01-06` lists apply to the S26 Ultra unchanged.
- `07-s26-ultra.txt` adds packages verified on a real S26 Ultra (SM-S948B), grouped by risk. Most of them also exist on the S25 series.
- For the on-device flow, use `canta-lists/s26-ultra.json` (Canta) or `termux-scripts/s26-ultra-debloat.sh` (Termux).

### OneUI 8.5 Galaxy AI features

OneUI 8.5 introduces new on-device AI features, including Call Screening, real-time Audio Eraser, an improved Photo Assist, Bixby Vision, and Interpreter. If you use any of them, keep the related packages. Verified on a Galaxy S26 Ultra (SM-S948U1, OneUI 8.5):

```
com.samsung.android.aicore             Samsung AI Core (Galaxy AI engine)
com.google.android.aicore              Google AICore (Gemini Nano models)
com.samsung.android.callassistant      Call Assistant / Call Screening (new in 8.5)
com.samsung.android.smartcallprovider  Smart Call (caller ID / spam)
com.samsung.android.visionintelligence Bixby Vision / visual intelligence
com.samsung.android.app.interpreter    Interpreter (live translation)
com.sec.android.mimage.photoretouching Photo editor (Photo Assist / object eraser)
com.sec.android.gallery3d              Gallery (Generative edit / Audio Eraser)
```

These are documented as keep notes in `06-oneui8-specific.txt`.

---

## Galaxy Z Fold 8 (OneUI 9)

The Galaxy Z Fold 8 launched in July 2026 with **OneUI 9 (Android 17)**, alongside the Fold 8 Ultra and Flip 8. The package notes below come from a US unlocked Z Fold 8 (SM-F971U1, OneUI 9.0, CSC VZW).

| Model | OS out of box | Form factor |
|-------|---------------|-------------|
| **Z Fold 8** (SM-F971) | OneUI 9 / Android 17 | Book-style foldable with cover screen |

### Debloating the Z Fold 8

- The main `01-07` lists still apply. Packages that no longer exist on OneUI 9 just report "not installed".
- `08-z-fold8.txt` adds Fold 8 / OneUI 9 packages grouped by risk, with KEEP notes for foldable and Galaxy AI packages. These were inspected on-device but not removal-tested.
- For the on-device flow, use `canta-lists/z-fold8.json` (Canta) or `termux-scripts/z-fold8-debloat.sh` (Termux).

### Foldable packages to keep

OneUI 9 has no standalone cover screen or Flex mode packages. Those features live in System UI and OneUI Home, plus:

```
com.samsung.android.app.aodservice   Always On Display and cover screen widgets
com.samsung.android.app.dressroom    Wallpaper and style (sets the cover screen wallpaper)
com.samsung.android.wallpaper.live   Live wallpapers, including fold-interactive ones
com.samsung.android.widget.pictureframe  Gallery widget (also on the cover screen; optional)
```

### OneUI 9 Galaxy AI packages

```
com.samsung.android.intellivoiceservice   Samsung Intelligence Voice Services (speech, AI translator)
com.samsung.android.offline.languagemodel On-device language model packs
com.samsung.android.vision.model          AI Core vision model assets
com.samsung.android.scs                   AI search, image and suggestion engine
com.samsung.android.visual.cloudcore      Content credentials (C2PA) for AI-edited images
com.samsung.android.smartsuggestions      Now Brief (optional, see 08-z-fold8.txt)
```

---

## Bloatware Differences

### S25 / S25+
- Standard Samsung apps
- No S Pen packages
- Fewer camera-specific packages

### S25 Edge
- Edge panel apps
- Curved display features
- Additional camera packages

### S25 Ultra
- S Pen related apps (`com.samsung.android.sdk.pen`)
- Advanced camera features
- Samsung Notes enhanced features
- More pre-installed Samsung apps

---

## Package Differences

### S Pen Packages (Ultra Only)

**Safe to remove if:**
- You don't use S Pen features
- You use third-party note apps

**Packages:**
```
com.samsung.android.sdk.pen
com.samsung.android.sdk.penremote
com.samsung.android.penup
```

**Keep if:**
- You use S Pen regularly
- You use Air Actions
- You use Samsung Notes with S Pen

### Edge Display Packages (Edge Model)

**Packages:**
```
com.samsung.android.app.clipboardedge
com.samsung.android.app.taskedge
com.samsung.android.cocktailbarservice
```

**Safe to remove if:**
- You don't use Edge panels
- You find Edge panels distracting

---

## Regional Variants

### United States
- More carrier bloatware
- Facebook, Microsoft pre-installed
- Carrier-specific apps

### Europe
- Less bloatware (GDPR)
- Some EU-specific apps
- Different carrier apps

### Asia (Korea, Japan)
- Region-specific apps
- More Samsung ecosystem apps
- Local carrier bloatware

---

## Cross-Model Compatibility

### Scripts Work On All Models

All debloat scripts in this repository work on:
- Galaxy S25
- Galaxy S25+
- Galaxy S25 Edge  
- Galaxy S25 Ultra
- Galaxy S26 Ultra
- Galaxy Z Fold 8 (OneUI 9)

### Model-Specific Notes

**If using S25/S25+:**
- Skip S Pen related packages (won't exist)
- May have fewer camera packages

**If using S25 Ultra:**
- Review S Pen packages before removing
- More Samsung apps pre-installed
- Check `06-oneui8-specific.txt` for Ultra packages

**If using S26 Ultra:**
- Runs OneUI 8.5; the main lists still apply
- Review S Pen packages before removing
- Use `07-s26-ultra.txt` for the verified S26 Ultra extras
- Keep Galaxy AI packages if you use the new OneUI 8.5 AI features

**If using Z Fold 8 (or another OneUI 9 foldable):**
- Use `08-z-fold8.txt` for the Fold 8 extras
- Read its KEEP section before removing anything wallpaper, AOD or widget related
- Test the cover screen and Flex mode after debloat

**If using S25 Edge:**
- Review Edge panel packages
- Some unique display-related apps

---

## Recommended Approach by Model

### S25 / S25+
1. Start with conservative script
2. Safe to be more aggressive
3. Fewer unique features to break

### S25 Edge
1. Start with conservative
2. Review Edge packages before removing
3. Test edge panels after debloat

### S25 Ultra
1. Start with conservative
2. **Don't remove S Pen packages** if you use it
3. More careful with Samsung apps
4. Test S Pen features after debloat

### S26 Ultra
1. Start with conservative, then add `07-s26-ultra.txt`
2. **Don't remove S Pen packages** if you use it
3. Review the CAUTION section of `07-s26-ultra.txt` before running it
4. Keep Galaxy AI packages if you use OneUI 8.5 AI features
5. Test S Pen and AI features after debloat

### Z Fold 8
1. Start with conservative, then add the SAFE section of `08-z-fold8.txt`
2. **Keep AOD, wallpaper and launcher packages** (they drive the cover screen)
3. Keep the OneUI 9 Galaxy AI packages if you use AI features
4. Test the cover screen, Flex mode, multi-window and Now Brief after debloat

---

**Last Updated:** October 2026
