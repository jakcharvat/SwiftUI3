//
//  SwipeActions.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct SwipeActions: View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]
    @State private var total = 0
    
    var body: some View {
        List {
            Text("Pepperoni pizza")
                .swipeActions {
                    Button("Order") {
                        print("Awesome!")
                    }
                    .tint(.green)
                }
            
            Text("Pizza with pineapple")
                .swipeActions(allowsFullSwipe: false) {
                    Button("Burn", role: .destructive) {
                        print("Right on!")
                    }
                }
            
            Section("People") {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions {
                            Button {
                                print("Muting conversation with \(friend)")
                            } label: {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)
                            
                            Button(role: .destructive) {
                                print("Deleting conversation with \(friend)")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
            
            Section("Calculator") {
                Text("Current Number: \(total)")
                
                
                ForEach(1..<101) { i in
                    Text("\(i)")
                        .swipeActions(edge: .leading) {
                            Button {
                                total += i
                            } label: {
                                Label("Add \(i)", systemImage: "plus.circle")
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                total -= i
                            } label: {
                                Label("Subtract \(i)", systemImage: "minus.circle")
                            }
                        }
                }
            }
        }
    }
}

struct SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActions()
    }
}
