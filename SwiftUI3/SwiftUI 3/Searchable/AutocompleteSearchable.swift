//
//  AutocompleteSearchable.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct AutocompleteSearchable: View {
    let names = ["Tim", "Craig", "Holly", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { name in
                NavigationLink {
                    Text(name)
                } label: {
                    Text(name)
                }
            }
        }
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { res in
                Text("Are you looking for \(res)?")
                    .searchCompletion(res)
            }
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct AutocompleteSearchable_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteSearchable()
    }
}
