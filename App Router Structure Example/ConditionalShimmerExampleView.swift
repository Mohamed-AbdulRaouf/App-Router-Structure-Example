//
//  ConditionalShimmerExampleView.swift
//  App Router Structure Example
//
//  Created by Raouf on 09/06/2025.
//


import SwiftUI

struct ConditionalShimmerExampleView: View {
    @State private var isLoading = true // This state controls the loading/shimmering
    
    var body: some View {
        VStack(spacing: 20) {
            // Your content or placeholders are always in the view hierarchy,
            // but the shimmer is conditionally applied.
            // When isLoading is false, the shimmer disappears and the base
            // placeholder color is revealed (or actual content replaces it in
            // a more complex setup).
            
            // Placeholder for an image
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray) // Base placeholder color
                .frame(width: 250, height: 150)
                .shimmer(isLoading: $isLoading) // Pass the binding
            
            // Placeholder for a title
            Text("") // An empty Text view acts as a placeholder
                .frame(width: 200, height: 25)
                .background(Color.green) // Base placeholder color
                .cornerRadius(6)
                .shimmer(isLoading: $isLoading, duration: 1.2, shimmerColor: .blue) // Custom shimmer
            
            // Placeholder for a description line (with staggered delay)
            Text("")
                .frame(width: 180, height: 20)
                .background(Color.red)
                .cornerRadius(6)
                .shimmer(isLoading: $isLoading, startDelay: 0.2) // Staggered start
            
            Text("")
                .frame(width: 160, height: 20)
                .background(Color.cyan)
                .cornerRadius(6)
                .shimmer(isLoading: $isLoading, startDelay: 0.4) // Staggered start
            
            // Simulate actual content appearing after loading
            if !isLoading {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                    Text("Data Loaded Successfully!")
                        .font(.headline)
                        .padding(.top, 5)
                    Button {
                        
                    } label: {
                        Text("Checkout")
                            .background(.red)
                            .frame(width: .infinity, height: 55)
                            .padding(.horizontal)
                    }
                }
                .transition(.opacity.animation(.easeIn(duration: 0.5))) // Smooth transition for loaded content
            }
        }
        .onAppear {
            // Simulate a network request or data loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoading = false // Set isLoading to false after 3 seconds
            }
        }
        .navigationTitle("Conditional Shimmer")
    }
}

struct ConditionalShimmerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalShimmerExampleView()
    }
}
