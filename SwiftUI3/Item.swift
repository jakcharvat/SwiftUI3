//
//  Item.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI


struct Item: Identifiable {
    fileprivate init(id: UUID = UUID(), name: String, children: [Item]? = nil, child: AnyView? = nil) {
        self.id = id
        self.name = name
        self.children = children
        self.child = child
    }
    
    let id: UUID
    let name: String
    var children: [Item]?
    let child: AnyView?
    
    func emphasising(_ search: String) -> Item {
        let newChildren = children?.map { $0.emphasising(search) }
        
        let regex = try! NSRegularExpression(pattern: "(\(search))", options: .caseInsensitive)
        let range = NSMakeRange(0, name.count)
        let newName = regex.stringByReplacingMatches(in: name, options: [], range: range, withTemplate: "**$1**")
        return Item(id: id, name: newName, children: newChildren, child: child)
    }
    
    func withChildren(_ children: [Item]) -> Item {
        return Item(id: id, name: name, children: children, child: child)
    }
    
    var titleView: Text {
        let components = name.components(separatedBy: "**")
        if components.count == 1 || components.count % 2 == 0 {
            return Text(name)
        }
        
        return components.reduce((0, Text(""))) { acc, curr in
            let newNum = acc.0 + 1
            let newText = acc.0 % 2 == 0
                ? Text(curr)
                : Text(curr).fontWeight(.heavy).foregroundColor(.accentColor)
            return (newNum, acc.1 + newText)
        }.1
    }
}


func page<T>(name: String, @ViewBuilder child: () -> T) -> Item where T: View {
    return Item(name: name, child: AnyView(child()))
}

func group(name: String, @ItemBuilder children: () -> [Item]) -> Item {
    return Item(name: name, children: children())
}


@resultBuilder
struct ItemBuilder {
    static func buildBlock(_ components: Item...) -> [Item] {
        return components
    }
}
