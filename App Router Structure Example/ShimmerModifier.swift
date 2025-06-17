//
//  ShimmerModifier.swift
//  App Router Structure Example
//
//  Created by Raouf on 09/06/2025.
//


import SwiftUI

// MARK: - ShimmerModifier
struct ShimmerModifier: ViewModifier {
    // MARK: - Internal State
    // These points control the position of the gradient for animation
    @State private var startPoint: UnitPoint = .init(x: -1, y: 0.5)
    @State private var endPoint: UnitPoint = .init(x: 0, y: 0.5)

    // MARK: - Customizable Properties via init
    @Binding var isLoading: Bool // New: Binding to control shimmer visibility and animation

    let duration: Double       // Duration of one complete shimmer cycle
    let shimmerColor: Color    // The bright part of the shimmer gradient
    let blendMode: BlendMode   // How the shimmer gradient blends with the underlying content
    let startDelay: Double     // Delay before the animation starts (useful for staggered effects)

    // MARK: - Initializer
    /// Creates a ShimmerModifier with specified animation parameters.
    /// - Parameters:
    ///   - isLoading: A binding to a Boolean that controls the visibility and animation of the shimmer.
    ///   - duration: The duration of one complete shimmer cycle (default: 0.9 seconds).
    ///   - shimmerColor: The bright color used in the shimmer gradient (default: white with 40% opacity).
    ///   - blendMode: The blend mode applied to the shimmer gradient (default: .screen).
    ///   - startDelay: An optional delay before the shimmer animation begins (default: 0.0 seconds).
    init(isLoading: Binding<Bool>, duration: Double = 0.9, shimmerColor: Color = Color.white.opacity(0.4), blendMode: BlendMode = .screen, startDelay: Double = 0.0) {
        self._isLoading = isLoading // Assign the binding
        self.duration = duration
        self.shimmerColor = shimmerColor
        self.blendMode = blendMode
        self.startDelay = startDelay
    }

    // MARK: - ViewModifier Body
    func body(content: Content) -> some View {
        content
            .overlay(
                // Only apply the shimmer gradient overlay if isLoading is true
                Group {
                    if isLoading {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                shimmerColor, // Use the custom shimmer color
                                Color.clear
                            ]),
                            startPoint: startPoint,
                            endPoint: endPoint
                        )
                        .blendMode(blendMode) // Apply the custom blend mode
                        .onAppear {
                            // Start animation only if isLoading is true when the gradient appears
                            DispatchQueue.main.asyncAfter(deadline: .now() + startDelay) {
                                // Check isLoading again in case it changed rapidly
                                if isLoading {
                                    withAnimation(
                                        Animation.linear(duration: duration) // Use the custom duration
                                            .repeatForever(autoreverses: false) // Loop infinitely, always moving forward
                                    ) {
                                        // Move the gradient completely across the view
                                        startPoint = .init(x: 1, y: 0.5)
                                        endPoint = .init(x: 2, y: 0.5)
                                    }
                                }
                            }
                        }
                        // When isLoading becomes false, the LinearGradient view is removed from the hierarchy,
                        // which automatically stops its animation and makes it invisible.
                        // When it becomes true again, it's re-added, and .onAppear will fire again.
                    }
                }
            )
            // CRUCIAL: Masks the shimmer (when visible) to the shape of the original content.
            // This mask applies regardless of isLoading, ensuring your content always maintains its shape.
            .mask(content)
    }
}

// MARK: - View Extension for Easy Application
extension View {
    /// Applies a shimmer loading effect to the view, controlled by an isLoading binding.
    /// The shimmer appears when `isLoading` is true and disappears when it's false.
    /// - Parameters:
    ///   - isLoading: A binding to a Boolean that controls the visibility and animation of the shimmer.
    ///   - duration: The duration of one complete shimmer cycle (default: 0.9 seconds).
    ///   - shimmerColor: The bright color used in the shimmer gradient (default: white with 40% opacity).
    ///   - blendMode: The blend mode applied to the shimmer gradient (default: .screen).
    ///   - startDelay: An optional delay before the shimmer animation begins (default: 0.0 seconds).
    /// - Returns: A view with the shimmer effect applied.
    func shimmer(isLoading: Binding<Bool>, duration: Double = 0.9, shimmerColor: Color = Color.white.opacity(0.4), blendMode: BlendMode = .screen, startDelay: Double = 0.0) -> some View {
        self.modifier(ShimmerModifier(isLoading: isLoading, duration: duration, shimmerColor: shimmerColor, blendMode: blendMode, startDelay: startDelay))
    }
}
