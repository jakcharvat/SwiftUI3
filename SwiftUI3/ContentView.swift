//
//  ContentView.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI


struct ContentView: View {
    @State private var closedViews: [UUID : Bool] = [:]
    @State private var search = ""

    @ItemBuilder
    private var items: [Item] {
        group(name: "SwiftUI 3") {
            group(name: "Search") {
                page(name: "Simple Searchable") { SearchableView() }
                page(name: "Autocompletion Searchable") { AutocompleteSearchable() }
            }
 
            group(name: "Sheets and Alerts") {
                page(name: "Sheets") { SheetNews() }
                page(name: "Alerts") { AlertNews() }
            }
            
            group(name: "Form Controls") {
                page(name: "Keyboard Controls") { KeyboardControls() }
                page(name: "OnSubmit") { OnSubmit() }
            }

            group(name: "Others") {
                page(name: "Async pull to refresh") { AsyncPullToRefresh() }
                page(name: "Swipe Actions") { SwipeActions() }
                page(name: "Materials") { Materials() }
                page(name: "Async Image") { AsyncImageView() }
                page(name: "Badges") { Badges() }
                page(name: "Markdown") { Markdown() }
                page(name: "Menus") { Menus() }
                page(name: "Foreground Styles") { ForegroundStyles() }
                page(name: "List Separators") { ListSeparators() }
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredItems(items), id: \.id) { item in
                    recursiveView(item)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("iOS 15 Playground")
            .searchable(text: $search)
        }
    }
    

    @ViewBuilder
    func recursiveView(_ item: Item) -> some View {
        if let child = item.child {
            NavigationLink {
                child.navigationTitle(item.name)
            } label: {
                item.titleView
            }
        } else if let children = item.children {
            AnyView(Section(header: item.titleView) {
                ForEach(children, id: \.id) { child in
                    recursiveView(child)
                }
            })
        } else {
            Text("No Child")
        }
    }
 
    
    func filteredItems(_ items: [Item]) -> [Item] {
        if search.isEmpty { return items }
        
        return items.compactMap { (item: Item) -> Item? in
            if let children = item.children {
                let filteredChildren = filteredItems(children)
                if !filteredChildren.isEmpty {
                    return item.emphasising(search).withChildren(filteredChildren)
                }
            }
            
            if item.name.lowercased().contains(search.lowercased()) {
                return item.emphasising(search)
            }

            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
