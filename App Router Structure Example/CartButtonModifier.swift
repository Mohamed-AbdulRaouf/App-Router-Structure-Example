//
//  CartButtonModifier.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//


import SwiftUI

/// A ViewModifier to add a cart button to the navigation bar's trailing side.
public struct CartButtonModifier: ViewModifier {
    @EnvironmentObject var appRouter: AppRouter // Access the AppRouter from the environment
    
    var systemImageName: String // Parameter for the SF Symbol name
    var tintColor: Color        // Parameter for the button's tint color
    var badgeCount: Int?        // Optional parameter for a cart item count badge
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Navigate to the cart view on the current tab
                        appRouter.navigate(to: .cart)
                    } label: {
                        HStack(spacing: 0) { // Use HStack for icon and optional badge
                            Image(systemName: systemImageName)
                                .font(.headline)
                                .foregroundColor(tintColor)
                            
                            if let count = badgeCount, count > 0 {
                                Text("\(count)")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: -8, y: -8) // Adjust position of the badge
                            }
                        }
                    }
                }
            }
    }
}
