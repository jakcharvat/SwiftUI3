//
//  Materials.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct Materials: View {
    var body: some View {
        ZStack {
            Image("DB BR 102")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text("DB BR 102")
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(4)
                
                Text("Skoda 109e3")
                    .padding()
                    .background(.regularMaterial)
                 // With fg-color secondary the material even affects the text colour
                    .foregroundColor(.secondary)
                    .cornerRadius(4)
            }
        }
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding()
    }
}

struct Materials_Previews: PreviewProvider {
    static var previews: some View {
        Materials()
    }
}
