//
//  AsyncImageView.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png")) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
            Text("Hello, World!")
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
