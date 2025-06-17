//
//  AppRoute.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//


// MARK: - 1. Define Your Routes (Updated)

import Foundation

enum AppRoute: Hashable, Identifiable {
    case home
    case productDetail(id: String)
    case settings
    case profile
    case onboarding
    case raouf
    case shimmer
    
    // Full Screen Cover Routes
    case disclaimer
    case welcomeTutorial // Example of a tutorial that might be a full screen cover
    
    // NEW: Cart Route
    case cart
    
    var id: String {
        switch self {
        case .home: return "home"
        case .productDetail(let id): return "productDetail-\(id)"
        case .settings: return "settings"
        case .profile: return "profile"
        case .onboarding: return "onboarding"
        case .disclaimer: return "disclaimer"
        case .welcomeTutorial: return "welcomeTutorial"
        case .cart: return "cart" // NEW
        case .raouf: return "raouf"
        case .shimmer: return "shimmer"
        }
    }
}
