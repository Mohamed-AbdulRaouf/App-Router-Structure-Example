//
//  CustomNavigationBar.swift
//  App Router Structure Example
//
//  Created by Raouf on 30/05/2025.
//
import SwiftUI


// MARK: - Custom Navigation Bar Component (Remains the same)
struct CustomNavigationBar: View {
    var title: String
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    var leftButtonIcon: String?
    var rightButtonIcon: String?
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 55) // Adjust top space as desired
            
            HStack {
                // Left Button/Icon
                if let leftButtonIcon = leftButtonIcon {
                    Button(action: {
                        leftButtonAction?()
                    }) {
                        Image(systemName: leftButtonIcon)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                } else {
                    Spacer()
                        .frame(width: 40)
                }
                
                Spacer()
                
                // Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                // Right Button/Icon
                if let rightButtonIcon = rightButtonIcon {
                    Button(action: {
                        rightButtonAction?()
                    }) {
                        Image(systemName: rightButtonIcon)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                } else {
                    Spacer()
                        .frame(width: 40)
                }
            }
            .frame(height: 50)
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Detail View (The View you navigate to)

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // Your custom navigation bar for the detail view
            CustomNavigationBar(
                title: "Detail Page",
                leftButtonAction: {
                    // This action will dismiss the current view, acting as a custom back button
                    presentationMode.wrappedValue.dismiss()
                    print("Custom back button tapped!")
                },
                leftButtonIcon: "chevron.left" // A common icon for back
            )
            
            Spacer()
            
            Text("This is the detail page content!")
                .font(.title2)
                .padding()
            
            Button("Go Back (programmatic)") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        // !!! IMPORTANT: Hide the default navigation bar for THIS view !!!
        // navigationBarBackButtonHidden(true) is REMOVED here
        .navigationBarHidden(true)
    }
}


// MARK: - MyContainerView (The View you navigate FROM)

struct MyContainerView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Custom Navigation Bar for the Home Screen
                CustomNavigationBar(
                    title: "Home Screen",
                    leftButtonAction: {
                        print("Menu button tapped!")
                    },
                    rightButtonAction: {
                        print("Settings button tapped!")
                    },
                    leftButtonIcon: "line.horizontal.3",
                    rightButtonIcon: "gearshape"
                )
                
                Spacer()
                
                Text("Welcome to My Awesome App!")
                    .font(.title)
                    .padding()
                
                // --- Navigation Link to the Detail View ---
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail Page")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
                
                Spacer()
            }
            // IMPORTANT: Hide the default navigation bar for the Home Screen
            // navigationBarBackButtonHidden(true) is REMOVED here
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Preview Provider

struct MyContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MyContainerView()
    }
}
