//
//  AlertNews.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct AlertNews: View {
    @State private var showingAlert = false
    
    @State private var showingConfirmationDialog = false
    @State private var selectedColour = "None"
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Alerts").font(.title)
            
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Choose!", isPresented: $showingAlert) {
                Button("First", role: .destructive) { }
                Button("Second") { }
                Button("Third") { }
                
            // since no button with the `cancel` role is present, SwiftUI adds one automatically
                // Button("OK", role: .cancel) { }
            }

            Divider()

            Text("Confirmation Dialogs").font(.title)
            
            Button("Choose a colour") {
                showingConfirmationDialog = true
            }
            .confirmationDialog("Choose a colour", isPresented: $showingConfirmationDialog) {
                Button("Red") {
                    selectedColour = "Red"
                }
                
                Button("Green") {
                    selectedColour = "Green"
                }
                
                Button("Blue") {
                    selectedColour = "Blue"
                }
                
                Button("None", role: .destructive) {
                    selectedColour = "None"
                }
            }
            
            Text("Chosen colour: \(selectedColour)")
        }
        .padding()
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        AlertNews()
    }
}
