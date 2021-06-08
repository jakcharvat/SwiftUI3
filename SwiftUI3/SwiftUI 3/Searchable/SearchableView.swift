//
//  SearchableView.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    
    var body: some View {
        Text("Searching for \(searchText)")
            .searchable(text: $searchText)
    }
}

struct Searchable_Previews: PreviewProvider {
    static var previews: some View {
        SearchableView()
    }
}
