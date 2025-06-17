//
//  CartView.swift
//  App Router Structure Example
//
//  Created by Raouf on 25/05/2025.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        GeometryReader { geometry in // Use GeometryReader to get available space
            ZStack(alignment: .top) { // Align content to the top
                // MARK: - Background Image Layer
                Image("background-image") // Your image asset name
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fill) // Fill the frame while maintaining aspect ratio
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3) // Set height to 30% of screen height
                    .clipped() // Clip any content that overflows the frame
                    .ignoresSafeArea(.all, edges: .top) // Extend image to the top safe area

                // MARK: - Cart Content Layer
                VStack {
                    // Spacer to push content below the image
                    Spacer()
                        .frame(height: geometry.size.height * 0.25) // Adjust this based on image height and desired offset

                    Text("Your Shopping Cart")
                        .font(.largeTitle)
                        .fontWeight(.bold) // Make title more prominent
                        .foregroundColor(.primary) // Ensure text color contrasts with background
                        .padding(.bottom, 5)

                    Text("Items in cart: 3 (Example)")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding(.bottom)

                    Spacer() // Pushes the buttons to the bottom if content is short

                    Button("Continue Shopping") {
                        appRouter.navigateBack() // Pop back to the previous view
                    }
                    .buttonStyle(.borderedProminent) // Use a modern button style
                    .tint(.blue)
                    .padding(.bottom, 10)

                    Button("Proceed to Checkout") {
                        // TODO: Implement checkout flow or navigate to a checkout route
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Align VStack content to top
                .padding(.top, geometry.size.height * 0.05) // Add some padding from the very top, if needed
            }
        }
        .navigationTitle("Cart") // Hide default navigation title to give more space for the image
        .navigationBarTitleDisplayMode(.inline) // Ensure title space is minimal
        .ignoresSafeArea(.all, edges: .bottom) // Make content extend to bottom safe area if needed
        .background(.green)
        .toolbarRole(.editor)
    }

}
