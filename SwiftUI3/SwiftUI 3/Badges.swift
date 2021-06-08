//
//  Badges.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct Badges: View {
    var body: some View {
        TabView {
            HomeScreen()
            SettingsScreen()
        }
    }
}


fileprivate struct HomeScreen: View {
    @State private var badgeCount = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                badgeCount += 1
            } label: {
                Label("Increase Badge Value", systemImage: "plus.circle")
                    .font(.title2)
            }

            Button {
                badgeCount -= 1
            } label: {
                Label("Decrease Badge Value", systemImage: "minus.circle")
                    .font(.title2)
            }
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
        .badge(badgeCount == 0 ? nil : "\(badgeCount)")
    }
}


fileprivate struct SettingsScreen: View {
    var body: some View {
        List {
            Text("Wi-Fi")
                .badge("LAN Solo")
            
            Text("Bluetooth")
                .badge("On")
        }
        .tabItem {
            Label("Settings", systemImage: "gearshape.fill")
        }
    }
}


struct Badges_Previews: PreviewProvider {
    static var previews: some View {
        Badges()
    }
}
