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
- **2026-11-03** — DEC-13: MNGBrandColors.swift adds navicon and the section bar colors per market. Figma: Shell colors · iOS (312) + Shell theme · iOS (20 modes).
- **2026-11-03** — DEC-14: control tokens generated (see mng_apps_core_ds DECISIONS DEC-14).
- **2026-11-04** — DEC-14: app shell exceptions removed (majority values); Continue size tokens. See mng_apps_core_ds PROGRESS.
- **2026-11-05** — Repo links point to the dfmedia org (CLAUDE.md, README.md; same change in mng_apps_core_ds).
- **2026-11-05** — DEC-15: `header` (MNGBrandPalette.header) now follows navbar (regenerated from mng_apps_core_ds). Figma: Components · App shell › 01 · Header band exceptions; header variables wait on the Core library import (majority vs suggested override per exception market).
- **2026-11-05** — Figma: header variables in Shell colors · iOS (78, aliases of Core navbar) and Shell theme · iOS; Header band exceptions rebuilt on the live variables (see mng_apps_core_ds DEC-15).
- **2026-11-05** — DEC-15 overrides accepted: MNGBrandPalette.headerOverride for DP, MC, NYDN, OS, SS, TPD, TSAR, VP (header = override ?? navbar). Figma: those 8 header variables hold the shipped hex; samples relinked. See mng_apps_core_ds DEC-15.
- **2026-11-10** — DEC-16: Tokens/MNGSystemColors.swift (system colors: Core 11 + iOS 77, plus 8 brand-following properties on MNGBrandPalette), generated from mng_apps_core_ds.
- **2026-11-10** — Figma: System colors · iOS (85 variables, 8 alias the Core Brand theme) collection (DEC-16; see mng_apps_core_ds).
- **2026-11-10** — Compile check (GitHub Actions, `.github/workflows/compile.yml`): `swiftc -typecheck` of Tokens/ and Components/ against the iOS 15 simulator SDK on every push. First run found that `MNGPrimaryButtonStyle` did not compile (private view named `Body` clashed with ButtonStyle.Body; renamed `StyledLabel`). Generated token files passed as they were. Green from 3f7477c. See mng_apps_core_ds PROGRESS.
- **2026-11-10** — Figma: Components · App shell › 01 · Header band exceptions rebuilt (updated intro; majority side bound to Core navbar/navtext, override side to the <market>/header variables, all 8 markets). Builder: mng_apps_core_ds scripts/figma_role_exceptions.py ios.
- **2026-11-10** — Figma: Components · Controls › 02 · Checkbox (as shipped): component set Checkbox · iOS (as shipped), 8 image sets × Checked/Unchecked, 30 × 30 pt bound to checkbox/size, the 17 shipped @3x images (checked byte for byte on upload). Placement and Uncheck-Grey: Core MISSING-ASSETS 5.8. Builder and data: mng_apps_core_ds scripts/figma_ios_checkbox.py, docs/components/CHECKBOX-IOS.md.
- **2026-11-11** — DEC-19: MISSING-ASSETS references renumbered (button values 5.5 → 5.4) in MNGButton.swift and the regenerated MNGButtonTokens.swift. See mng_apps_core_ds PROGRESS.
- **2026-11-18** — Figma: Components · Button › 03 · iOS buttons as shipped (Apps team) and 04 · Primary button: our spec vs what ships (review only, built from mng_apps_core_ds data/button-ios-review.json; no change to the Button component). See mng_apps_core_ds PROGRESS.
- **2026-11-19** — Figma: Components · Controls › 02 · Checkbox texts and description updated in place (Apps team 5.7: images centered at natural size, Uncheck-Grey unused); Components · Button › 04 re-run (MISSING-ASSETS 5.10, screenshot notes). Library needs publishing. See mng_apps_core_ds PROGRESS.
- **2026-11-19** — MNGButton.swift comments: provisional font and pressed state now point at MISSING-ASSETS 5.10 (5.4 is Android only now); MNGButtonTokens.swift comments regenerated (mng_apps_core_ds).
- **2026-11-19** — DEC-21: `continueButton` removed from MNGBrandPalette (continue is Android only now; unused here). Regenerated from mng_apps_core_ds.
- **2026-11-19** — Tokens from TroncKit f79fe3339 (Core mng_apps_core_ds same day): 10 new type styles, 22 component.ios sizes. DEC-22: MNGPrimaryButton / MNGTextLinkButton / MNGPrimaryButtonStyle match the meter paywall purchase button (radius 8, 0.7 pt border in the fill, 45 pt, link underlined). Figma: Type · Text styles +10, Components · iOS +22 variables, Button · iOS border-width, Button/Primary border. Compile green (75475e3).
- **2026-11-19** — Figma: Components · App shell › 02 · App shell components (as shipped): App shell/Top bar, Section tabs, Breaking-news banner, Tab bar, bound to Core Brand theme and this file's Shell theme and Components variables (Core mng_apps_core_ds log).
- **2026-11-24** — Figma: Components · Controls › 03 · Savings label (as shipped), component bound to Components · iOS savings-label sizes and Core Brand theme buy (Core mng_apps_core_ds DEC-25 for the Android side).
- **2026-11-25** — DEC-28 (Core mng_apps_core_ds): first traced icon SVGs, iOS only, in icons/traced/: skip-back-15, skip-forward-15 (PostKit 15-second skip), exit-full-screen, player-error (error and offline), enews-coach-arrow. Each checked against the shipped PNG at its size (Core scripts/trace_icons.py, data/icon-traces.json).
