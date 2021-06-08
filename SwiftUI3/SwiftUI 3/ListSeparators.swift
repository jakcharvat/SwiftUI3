//
//  ListSeparators.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct ListSeparators: View {
    var body: some View {
        List {
            ForEach(0..<10) { i in
                Text("Row \(i) - hidden")
                    .listRowSeparator(.hidden)
            }
            
            ForEach(0..<10) { i in
                Text("Row \(i + 10) - opacity \(i * 10)%")
                    .listRowSeparatorTint(.primary.opacity(Double(i) / 10))
            }
        }
    }
}

struct ListSeparators_Previews: PreviewProvider {
    static var previews: some View {
        ListSeparators()
    }
}
