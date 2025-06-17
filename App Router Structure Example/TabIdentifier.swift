//
//  TabIdentifier.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//


// MARK: - 2. Create a Navigation Manager (Updated)
import SwiftUI

enum TabIdentifier: String, CaseIterable, Identifiable {
    case homeTab = "Home"
    case shopTab = "Shop"
    case settingsTab = "Settings"
    
    var id: String { self.rawValue }
    
    var systemImageName: String {
        switch self {
        case .homeTab: return "house.fill"
        case .shopTab: return "cart.fill"
        case .settingsTab: return "gearshape.fill"
        }
    }
}

class AppRouter: ObservableObject {
    // NavigationStack Path
    @Published var homePath = NavigationPath()
    @Published var shopPath = NavigationPath()
    @Published var settingsPath = NavigationPath()
    
    // Tab Selection
    @Published var selectedTab: TabIdentifier = .homeTab
    
    // Full Screen Cover Presentation
    @Published var fullScreenCoverRoute: AppRoute?
    
    // MARK: - NavigationStack Management (Specific to each tab's path)
    
    func navigate(to route: AppRoute, onTab tab: TabIdentifier? = nil) {
        let targetTab = tab ?? selectedTab // Navigate on current tab if not specified
        switch targetTab {
        case .homeTab:
            homePath.append(route)
        case .shopTab:
            shopPath.append(route)
        case .settingsTab:
            settingsPath.append(route)
        }
    }
    
    func navigateBack(onTab tab: TabIdentifier? = nil) {
        let targetTab = tab ?? selectedTab
        switch targetTab {
        case .homeTab:
            if !homePath.isEmpty { homePath.removeLast() }
        case .shopTab:
            if !shopPath.isEmpty { shopPath.removeLast() }
        case .settingsTab:
            if !settingsPath.isEmpty { settingsPath.removeLast() }
        }
    }
    
    func popToRoot(onTab tab: TabIdentifier? = nil) {
        let targetTab = tab ?? selectedTab
        switch targetTab {
        case .homeTab:
            homePath = NavigationPath()
        case .shopTab:
            shopPath = NavigationPath()
        case .settingsTab:
            settingsPath = NavigationPath()
        }
    }
    
    // MARK: - Tab Management
    
    func selectTab(_ tab: TabIdentifier) {
        self.selectedTab = tab
    }
    
    // MARK: - Full Screen Cover Management
    
    func presentFullScreenCover(for route: AppRoute) {
        self.fullScreenCoverRoute = route
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCoverRoute = nil
    }
}
