//
//  SheetNews.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI


fileprivate struct LockedSheet: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("hehe u cannot dismiss me by swiping 😛")
            Text("press the button to close me")
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            Button("Dismiss", action: close)
        }
        .interactiveDismissDisabled()
    }
    
    func close() {
        presentationMode.wrappedValue.dismiss()
    }
}


fileprivate struct TermsSheet: View {
    @State private var termsAccepted = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    Text("Lots of bs here")
                    if (termsAccepted) {
                        Text("U can dismiss the sheet now 🙂")
                            .font(.headline)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                Toggle("Accept", isOn: $termsAccepted)
            }
            .padding()
            .navigationTitle("Terms and conditions")
        }
        .interactiveDismissDisabled(!termsAccepted)
    }
}


struct SheetNews: View {
    @State private var showingLockedSheet = false
    @State private var showingTermsSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Show locked sheet") {
                showingLockedSheet.toggle()
            }
            .sheet(isPresented: $showingLockedSheet) {
                LockedSheet()
            }
            
            Button("Show terms and conditions") {
                showingTermsSheet.toggle()
            }
            .sheet(isPresented: $showingTermsSheet) {
                TermsSheet()
            }
        }
    }
}

struct SheetNews_Previews: PreviewProvider {
    static var previews: some View {
        SheetNews()
    }
}
