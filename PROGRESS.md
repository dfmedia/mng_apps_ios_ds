# Progress — MNG iOS Design System

Legend: ✅ done · 🔄 in progress · ⏸ waiting on review/input · ⬜ not started

| Step | Status | Notes |
|------|--------|-------|
| Repo and Figma file created | ✅ | 2026-10-20 |
| Receive approved iOS-only items from Core | ⬜ | Waiting on PLAT-01 … PLAT-10 (Core: docs/PLATFORM-OWNERSHIP.md) |

| Brand color tokens generated | ✅ | Tokens/MNGBrandColors.swift (DEC-04) |
| Button pilot (DEC-07) | ⏸ review | Tokens/MNGButtonTokens.swift (generated) and Components/Button/MNGButton.swift: MNGPrimaryButton, MNGTextLinkButton, SwiftUI MNGPrimaryButtonStyle. Not compiled yet |

## Log

- **2026-10-20** — Repo set up with CLAUDE.md pointing to Core instructions.
- **2026-10-21** — First generated brand color tokens from Core (DEC-04).
- **2026-10-26** — Button pilot (DEC-07): Tokens/MNGButtonTokens.swift (generated) and Components/Button/MNGButton.swift: MNGPrimaryButton, MNGTextLinkButton, SwiftUI MNGPrimaryButtonStyle. Not compiled yet. Core: docs/components/BUTTON.md, DEC-07 (mng_apps_core_ds). Figma: Button variables in this platform file.
- **2026-10-26** — Figma: page Components · Button with Button/Primary (Template Standard/Legacy × State) and Button/Text link; collections Button · iOS and Text link · iOS; text styles Button/Label, Button/Text link. Core library enabled (mng_apps_core_ds).
- **2026-10-30** — DEC-09: Tokens/MNGTypeStyles.swift (generated): every iOS text style as shipped, with legacy-template values (mng_apps_core_ds docs/TYPE-STYLES.md).
- **2026-11-03** — DEC-10: legacy-template values removed from MNGTypeStyles.swift, MNGButtonTokens.swift and MNGButton.swift (documented in mng_apps_core_ds docs/LEGACY-TEMPLATE.md).
- **2026-11-03** — Figma: 56 text styles + page Type · Text styles; legacy button variants and variables removed (DEC-10); Spacing · iOS variables. Tokens/MNGScaleTokens.swift generated (DEC-11, mng_apps_core_ds).
- **2026-11-03** — DEC-12: MNGScaleTokens.swift adds breakpoints and component metrics; text link uses MNGScale.sizeTouchMin. Figma: Breakpoints · iOS, Components · iOS; Text link bound to the touch target.
