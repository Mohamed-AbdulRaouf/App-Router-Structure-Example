//
//  HomeTabView.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//


// MARK: - 4. Create Your Destination Views (Updated)

import SwiftUI

// --- Tab Root Views ---

struct HomeTabView: View {
    @EnvironmentObject var appRouter: AppRouter
    @State private var cartItemCount: Int = 5 // Example state for badge count
    
    var body: some View {
        VStack {
            Text("Welcome to the Home Tab!")
                .font(.largeTitle)
                .padding()
            
            Button("Go to Product 123 (Shop Tab)") {
                appRouter.selectTab(.shopTab)
                appRouter.navigate(to: .productDetail(id: "123"), onTab: .shopTab)
            }
            .padding()
            
            Button("Go to Raouf") {
                appRouter.navigate(to: .raouf)
            }
            .padding()
            
            Button("Go to Shimmer") {
                appRouter.navigate(to: .shimmer)
            }
            .padding()
            
            Button("Go to Profile (Home Tab)") {
                appRouter.navigate(to: .profile, onTab: .homeTab)
            }
            .padding()
            
            Divider()
                .padding()
            
            Text("Full Screen Cover Examples:")
                .font(.headline)
            
            Button("Show Disclaimer (Full Screen)") {
                appRouter.presentFullScreenCover(for: .disclaimer)
            }
            .padding()
            
            Button("Show Welcome Tutorial (Full Screen)") {
                appRouter.presentFullScreenCover(for: .welcomeTutorial)
            }
            .padding()
            
            Button("Update Cart Count") {
                cartItemCount += 1
            }
            .padding()
        }
        .navigationTitle("Home")
        // Apply the custom cart button modifier here
        .addCartButton(badgeCount: cartItemCount) // Use the state for the badge
    }
}


struct ShopTabView: View {
    @State private var cartItemCount: Int = 5 // Example state for badge count
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Welcome to the Shop Tab!")
                .font(.largeTitle)
                .padding()
            
            Button("View Product A (Shop Tab)") {
                appRouter.navigate(to: .productDetail(id: "ProductA"), onTab: .shopTab)
            }
            .padding()
            
            Button("View Product B (Shop Tab)") {
                appRouter.navigate(to: .productDetail(id: "ProductB"), onTab: .shopTab)
            }
            .padding()
        }
        .navigationTitle("Shop")
        .addCartButton(badgeCount: cartItemCount) // Use the state for the badge
    }
}

struct SettingsTabView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Welcome to the Settings Tab!")
                .font(.largeTitle)
                .padding()
            
            Button("Go to Profile (Settings Tab)") {
                appRouter.navigate(to: .profile, onTab: .settingsTab)
            }
            .padding()
        }
        .navigationTitle("Settings")
    }
}

// --- Navigation Destination Views (same as before, or slightly adjusted) ---

struct ProductDetailView: View {
    @State private var cartItemCount: Int = 5 // Example state for badge count
    @EnvironmentObject var appRouter: AppRouter
    let productId: String
    
    var body: some View {
        VStack {
            Text("Product Detail for ID: \(productId)")
                .font(.title)
                .padding()
            
            Button("Back to Home Tab & Root") {
                appRouter.selectTab(.homeTab)
                appRouter.popToRoot(onTab: .homeTab)
            }
            .padding()
            
            Button("Go to Another Product (e.g., 456) on this tab") {
                // Navigates on the current tab's stack
                appRouter.navigate(to: .productDetail(id: "456"))
            }
            .padding()
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Product \(productId)")
            .customBackButton()
            .addCartButton(badgeCount: cartItemCount)
    }
}

struct SettingsView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Settings View (Pushed)")
                .font(.title)
                .padding()
            
            Button("Go to Profile from Settings (on current tab)") {
                appRouter.navigate(to: .profile)
            }
            .padding()
        }
        .navigationTitle("Settings Pushed")
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View (Pushed)")
                .font(.title)
                .padding()
        }
        .navigationTitle("Profile Pushed")
    }
}

struct OnboardingView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Welcome to Onboarding!")
                .font(.largeTitle)
                .padding()
            Text("This is a simulated onboarding flow (pushed).")
                .font(.body)
                .padding()
            
            Button("Complete Onboarding & Pop to Tab Root") {
                appRouter.popToRoot() // Pops on the currently selected tab
            }
            .padding()
        }
        .navigationTitle("Onboarding Pushed")
    }
}


// --- Full Screen Cover Views ---

struct DisclaimerView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Disclaimer")
                .font(.largeTitle)
                .padding()
            Text("By continuing, you agree to our terms and conditions.")
                .padding()
            Button("I Agree") {
                appRouter.dismissFullScreenCover()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.2).ignoresSafeArea())
    }
}

struct WelcomeTutorialView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        VStack {
            Text("Welcome Tutorial")
                .font(.largeTitle)
                .padding()
            Text("Learn how to use the app in this exciting tutorial!")
                .padding()
            Button("Start Using App") {
                appRouter.dismissFullScreenCover()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.2).ignoresSafeArea())
    }
}
