//
//  App_Router_Structure_ExampleApp.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//

import SwiftUI

@main
struct App_Router_Structure_ExampleApp: App {
    @StateObject var appRouter = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            MainAppView() // Renamed for clarity, it now contains the TabView
                .environmentObject(appRouter)
        }
    }
    
}

struct MainAppView: View {
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        TabView(selection: $appRouter.selectedTab) {
            // ... (Home Tab, Shop Tab, Settings Tab - unchanged) ...
            NavigationStack(path: $appRouter.homePath) {
                HomeTabView()
                    .navigationDestination(for: AppRoute.self) { route in
                        viewForRoute(route)
                    }
            }
            .tabItem {
                Label(TabIdentifier.homeTab.rawValue, systemImage: TabIdentifier.homeTab.systemImageName)
            }
            .tag(TabIdentifier.homeTab)
            
            NavigationStack(path: $appRouter.shopPath) {
                ShopTabView()
                    .navigationDestination(for: AppRoute.self) { route in
                        viewForRoute(route)
                    }
            }
            .tabItem {
                Label(TabIdentifier.shopTab.rawValue, systemImage: TabIdentifier.shopTab.systemImageName)
            }
            .tag(TabIdentifier.shopTab)
            
            NavigationStack(path: $appRouter.settingsPath) {
                SettingsTabView()
                    .navigationDestination(for: AppRoute.self) { route in
                        viewForRoute(route)
                    }
            }
            .tabItem {
                Label(TabIdentifier.settingsTab.rawValue, systemImage: TabIdentifier.settingsTab.systemImageName)
            }
            .tag(TabIdentifier.settingsTab)
        }
        .fullScreenCover(item: $appRouter.fullScreenCoverRoute) { route in
            // ... (Full Screen Cover Logic - unchanged) ...
            switch route {
            case .disclaimer:
                DisclaimerView()
            case .welcomeTutorial:
                WelcomeTutorialView()
            default:
                Text("Error: Unknown Full Screen Cover Route: \(route.id)")
                    .onAppear { appRouter.dismissFullScreenCover() }
            }
        }
    }
    
    // Helper to map AppRoute to a View for navigationDestination
    @ViewBuilder
    private func viewForRoute(_ route: AppRoute) -> some View {
        switch route {
        case .home:
            Text("This is a pushed Home View (shouldn't typically happen as home is a tab root)")
        case .productDetail(let id):
            ProductDetailView(productId: id)
        case .settings:
            SettingsView()
        case .profile:
            ProfileView()
        case .onboarding:
            OnboardingView()
        case .cart: // NEW: Handle the cart route
            CartView()
        case .disclaimer, .welcomeTutorial:
            Text("Error: \(route.id) should be a full screen cover, not a navigation destination.")
        case .raouf:
            MyContainerView()
        case .shimmer:
            ConditionalShimmerExampleView() //ShimmerExampleView()
        }
    }
}
