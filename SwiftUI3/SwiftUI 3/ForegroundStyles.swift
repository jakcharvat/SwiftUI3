//
//  ForegroundStyles.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct ForegroundStyles: View {
    var body: some View {
        List {
            //MARK: - Colours
            Section("Colours") {
                RowElement("Red", systemImage: "lightbulb.fill")
                    .foregroundStyle(.red)
                
                RowElement("Orange", systemImage: "lightbulb.fill")
                    .foregroundStyle(.orange)
                
                RowElement("Yellow", systemImage: "lightbulb.fill")
                    .foregroundStyle(.yellow)
                
                RowElement("Green", systemImage: "lightbulb.fill")
                    .foregroundStyle(.green)
                
                RowElement("Mint", systemImage: "lightbulb.fill")
                    .foregroundStyle(.mint)
                
                RowElement("Teal", systemImage: "lightbulb.fill")
                    .foregroundStyle(.teal)
                
                RowElement("Cyan", systemImage: "lightbulb.fill")
                    .foregroundStyle(.cyan)
                
                RowElement("Blue", systemImage: "lightbulb.fill")
                    .foregroundStyle(.blue)
                
                RowElement("Indigo", systemImage: "lightbulb.fill")
                    .foregroundStyle(.indigo)
                
                RowElement("Purple", systemImage: "lightbulb.fill")
                    .foregroundStyle(.purple)
                
                RowElement("Pink", systemImage: "lightbulb.fill")
                    .foregroundStyle(.pink)
                
                RowElement("Black", systemImage: "lightbulb.fill")
                    .foregroundStyle(.black)
                
                RowElement("Brown", systemImage: "lightbulb.fill")
                    .foregroundStyle(.brown)
                
                RowElement("Gray", systemImage: "lightbulb.fill")
                    .foregroundStyle(.gray)
                
                RowElement("White", systemImage: "lightbulb.fill")
                    .foregroundStyle(.white)
            }

            //MARK: - Contextual Colours
            Section("Contextual Colours") {
                RowElement("Background", systemImage: "wand.and.rays")
                    .foregroundStyle(.background)
                
                RowElement("Foreground", systemImage: "wand.and.rays")
                    .foregroundStyle(.foreground)
                
                RowElement("Selection", systemImage: "wand.and.rays")
                    .foregroundStyle(.selection)
                
                RowElement("Tint", systemImage: "wand.and.rays")
                    .foregroundStyle(.tint)
                
            }
 
            //MARK: - UIKit Emphasis
            Section("UIKit emphasis levels") {
                RowElement("Primary", systemImage: "1.circle")
                    .foregroundStyle(.primary)
                
                RowElement("Secondary", systemImage: "2.circle")
                    .foregroundStyle(.secondary)
                
                RowElement("Tertiary", systemImage: "3.circle")
                    .foregroundStyle(.tertiary)
                
                RowElement("Quaternary", systemImage: "4.circle")
                    .foregroundStyle(.quaternary)
            }
 
            //MARK: - Images and Gradients
            Section("Images and Gradients") {
                RowElement("Image", systemImage: "photo")
                    .foregroundStyle(.image(Image("DB BR 102").resizable()))
                Text("// \(Image(systemName: "arrowtriangle.up.square.fill")) that probably doesn't work lol")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(.tertiary)
                
                RowElement("Angular", systemImage: "location.north.fill")
                    .foregroundStyle(.angularGradient(colors: [.yellow, .mint], center: .leading, startAngle: .degrees(-90), endAngle: .degrees(90)))
                
                RowElement("Elliptical", systemImage: "oval.fill")
                    .foregroundStyle(.ellipticalGradient(colors: [.yellow, .mint], center: .leading, startRadiusFraction: 0, endRadiusFraction: 1))
                
                RowElement("Linear", systemImage: "line.horizontal.3")
                    .foregroundStyle(.linearGradient(colors: [.yellow, .mint], startPoint: .leading, endPoint: .center))
                
                RowElement("Radial", systemImage: "circle.fill")
                    .foregroundStyle(.radialGradient(colors: [.yellow, .mint], center: .leading, startRadius: 0, endRadius: 100))
                
            }

            //MARK: - Materials
            Section("Materials") {
                ZStack {
                    Image("DB BR 102")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack {
                        RowElement("Ultra Thin", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.ultraThinMaterial)
                        
                        RowElement("Thin", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.thinMaterial)
                        
                        RowElement("Regular", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.regularMaterial)
                        
                        RowElement("Thick", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.thickMaterial)
                        
                        RowElement("Ultra Thick", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.ultraThickMaterial)
                        
                        RowElement("Bar", systemImage: "rectangle.fill.on.rectangle.fill", badgeHidden: true)
                            .foregroundStyle(.bar)
                    }
                }
            }
        }
    }
}


fileprivate struct RowElement: View {
    init(_ title: String, systemImage: String, badgeHidden: Bool = false) {
        self.title = title
        self.systemImage = systemImage
        badgeText = badgeHidden ? nil : "(\(title))"
    }
    
    let title: String
    let badgeText: String?
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
            Text(title).lineLimit(1)
            if badgeText != nil {
                Text("")
                    .badge(badgeText)
                    .foregroundStyle(.foreground)
            }
        }
        .font(.title.bold())
    }
}


struct ForegroundStyles_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundStyles()
    }
}


fileprivate extension ViewBuilder {
    static func buildBlock<T: View>(_ components: T...) -> some View {
        ForEach(0..<components.count, id: \.self) { idx in
            components[idx]
        }
    }
}
