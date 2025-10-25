# Device Comparison Guide

Differences between Samsung Galaxy S25 models and debloating considerations.

## S25 Series Models

| Model | Screen | Battery | S Pen | Cameras | Unique Features |
|-------|--------|---------|-------|---------|----------------|
| **S25** | 6.2" | 4000mAh | No | Triple | Standard flagship |
| **S25+** | 6.7" | 4900mAh | No | Triple | Larger screen/battery |
| **S25 Edge** | 6.9" | 5000mAh | No | Quad | Curved edge display |
| **S25 Ultra** | 6.8" | 5000mAh | Yes | Quad | S Pen, premium |

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

### Model-Specific Notes

**If using S25/S25+:**
- Skip S Pen related packages (won't exist)
- May have fewer camera packages

**If using S25 Ultra:**
- Review S Pen packages before removing
- More Samsung apps pre-installed
- Check `06-oneui8-specific.txt` for Ultra packages

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

---

**Last Updated:** October 2025
