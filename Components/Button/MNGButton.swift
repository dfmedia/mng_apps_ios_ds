// MNG Apps button pilot (DEC-07). Spec: mng_apps_core_ds/docs/components/BUTTON.md
// Hand-written component code. Every value comes from the generated tokens:
//   Tokens/MNGBrandColors.swift  (fill = market `action`)
//   Tokens/MNGButtonTokens.swift (label, disabled, radius, height, fonts, link colors)
// Requires iOS 15+ (UIButton.Configuration); the app already needs iOS 15 for StoreKit 2.
import UIKit
import SwiftUI

// MARK: - UIKit

/// Primary button as shipped on iOS: `action` fill, white Open Sans Bold 14 uppercase label,
/// radius 4. (The iOS legacy-template markets ship radius 5 + a 1 pt border; acknowledged only, not built: DEC-10.)
/// Disabled uses the Core disabled colors. Pressed uses the system filled-button highlight.
public final class MNGPrimaryButton: UIButton {
    public let marketCode: String
    private let palette: MNGBrandPalette

    /// - Parameters:
    ///   - marketCode: market code, e.g. "TDP" (same as the Gradle flavor, upper-cased).
    ///   - title: label text; shown uppercase.
    public init?(marketCode: String, title: String) {
        guard let palette = MNGBrandPalettes.forMarket(marketCode) else { return nil }
        self.marketCode = marketCode
        self.palette = palette
        super.init(frame: .zero)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .fixed
        config.background.cornerRadius = MNGButtonTokens.cornerRadius
        config.title = title
        configuration = config
        configurationUpdateHandler = { [palette] button in
            guard var c = button.configuration else { return }
            let enabled = button.isEnabled
            let fill = enabled ? palette.action : MNGButtonTokens.disabledFill
            let label = enabled ? MNGButtonTokens.primaryLabel : MNGButtonTokens.disabledLabel
            c.baseBackgroundColor = fill
            c.baseForegroundColor = label
            c.attributedTitle = AttributedString((c.title ?? "").uppercased(),
                                                 attributes: AttributeContainer([.font: MNGButtonTokens.labelFont, .foregroundColor: label]))
            button.configuration = c
        }
        heightAnchor.constraint(greaterThanOrEqualToConstant: MNGButtonTokens.height).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("Use init(marketCode:title:)") }

    public func setTitle(_ title: String) {
        configuration?.title = title
        setNeedsUpdateConfiguration()
    }
}

/// Text link button as shipped on iOS (paywall Log In): market `paywallLinkColor`, no underline.
/// Font is provisional (MISSING-ASSETS 5.5).
public final class MNGTextLinkButton: UIButton {
    public init?(marketCode: String, title: String) {
        guard let color = MNGButtonTokens.linkColor(forMarket: marketCode) else { return nil }
        super.init(frame: .zero)
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: MNGButtonTokens.linkFont]))
        config.baseForegroundColor = color
        configuration = config
        heightAnchor.constraint(greaterThanOrEqualToConstant: MNGScale.sizeTouchMin).isActive = true   // Apple minimum touch target (DEC-11)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("Use init(marketCode:title:)") }
}

// MARK: - SwiftUI

/// SwiftUI version of `MNGPrimaryButton`. Usage: `Button("Log in") { … }.buttonStyle(MNGPrimaryButtonStyle(market: "TDP"))`
public struct MNGPrimaryButtonStyle: ButtonStyle {
    public let market: String
    public init(market: String) { self.market = market }

    public func makeBody(configuration: Configuration) -> some View {
        StyledLabel(configuration: configuration, market: market)
    }

    // Not named `Body`: that name is ButtonStyle's associated type (compile check, 2026-11-10).
    private struct StyledLabel: View {
        let configuration: ButtonStyleConfiguration
        let market: String
        @Environment(\.isEnabled) private var isEnabled

        var body: some View {
            let action = MNGBrandPalettes.forMarket(market)?.action ?? .systemBlue
            let fill = Color(uiColor: isEnabled ? action : MNGButtonTokens.disabledFill)
            let label = Color(uiColor: isEnabled ? MNGButtonTokens.primaryLabel : MNGButtonTokens.disabledLabel)
            let shape = RoundedRectangle(cornerRadius: MNGButtonTokens.cornerRadius)
            configuration.label
                .font(Font(MNGButtonTokens.labelFont))
                .textCase(.uppercase)
                .foregroundColor(label)
                .frame(maxWidth: .infinity, minHeight: MNGButtonTokens.height)
                .background(shape.fill(fill))
                .opacity(configuration.isPressed ? 0.8 : 1)   // pressed: not in the source (MISSING-ASSETS 5.5)
        }
    }
}
