# Device Comparison Guide

Differences between Samsung Galaxy S25 and S26 models and debloating considerations.

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

---

**Last Updated:** June 2026
