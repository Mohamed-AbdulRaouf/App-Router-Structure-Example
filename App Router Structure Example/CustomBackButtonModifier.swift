//
//  CustomBackButtonModifier.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//

import SwiftUI

/// A ViewModifier to customize the navigation bar's back button.
public struct CustomBackButtonModifier: ViewModifier {
    @EnvironmentObject var appRouter: AppRouter // Access the AppRouter from the environment
    
    var systemImageName: String // Parameter for the SF Symbol name
    var tintColor: Color        // Parameter for the button's tint color
    
    public func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        appRouter.navigateBack() // Use the router's back function
                    } label: {
                        Image(systemName: systemImageName)
                            .font(.headline) // Standard size for navigation bar icons
                            .foregroundColor(tintColor)
                    }
                }
            }
    }
}

