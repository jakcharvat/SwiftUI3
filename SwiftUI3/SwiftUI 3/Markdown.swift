//
//  Markdown.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI


struct Markdown: View {
    var body: some View {
        Text("Now we have `markdown` support in SwiftUI")
        Text("Some **bold** text")
        Text("Some *italic* text")
        Text("Some ***bold italic*** text")
        Text("Some ~~strikethrough~~ text")
        Text("Some `monospaced` text")
        Text("And [links](https://apple.com) work too")
    }
}

struct Markdown_Previews: PreviewProvider {
    static var previews: some View {
        Markdown()
    }
}
