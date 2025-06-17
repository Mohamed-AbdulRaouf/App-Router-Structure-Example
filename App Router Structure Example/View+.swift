//
//  View+.swift
//  App Router Structure Example
//
//  Created by Raouf on 17/06/2025.
//

import SwiftUI
// MARK: - View Extension for Convenience

extension View {
    /// Adds a cart button to the navigation bar's trailing side.
    /// - Parameters:
    ///   - systemImage: The SF Symbol name for the cart icon. Defaults to "cart.fill".
    ///   - tint: The tint color for the cart icon. Defaults to .blue.
    ///   - badgeCount: An optional integer to display as a badge on the cart icon.
    public func addCartButton(systemImage: String = "cart.fill", tint: Color = .red, badgeCount: Int? = nil) -> some View {
        self.modifier(CartButtonModifier(systemImageName: systemImage, tintColor: tint, badgeCount: badgeCount))
    }
    
    /// Applies a custom back button to the navigation bar.
    /// - Parameters:
    ///   - systemImage: The SF Symbol name for the back button icon. Defaults to "chevron.left".
    ///   - tint: The tint color for the back button icon. Defaults to .blue.
    public func customBackButton(systemImage: String = "chevron.left", tint: Color = .red) -> some View {
        self.modifier(CustomBackButtonModifier(systemImageName: systemImage, tintColor: tint))
    }
}
