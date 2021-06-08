//
//  AsyncPullToRefresh.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI


fileprivate struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
}


struct AsyncPullToRefresh: View {
    @State private var news = [
        NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
    ]
    
    var body: some View {
        List(news) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                Text(item.strap)
                    .foregroundColor(.secondary)
            }
        }
        .refreshable {
            do {
                let url = URL(string: "https://hackingwithswift.com/samples/news-1.json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                if Int.random(in: 0...2) == 2 { throw FetchError.err }
                news = try JSONDecoder().decode([NewsItem].self, from: data)
            } catch {
                news = [NewsItem(id: 0, title: "Failed to fetch articles", strap: "Pull down to try again")]
            }
        }
    }
}


fileprivate enum FetchError: Error {
    case err
}

struct AsyncPullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPullToRefresh()
    }
}
