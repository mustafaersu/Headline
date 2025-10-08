//
//  NewsView.swift
//  Headline
//
//  Created by Mustafa Ersu on 29.09.2025.
//

import SwiftUI

struct NewsView: View {
    var new: ArticleModel
    @State private var showWebView = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(new.title.count > 65 ? String(new.title.prefix(65)) + "..." : new.title)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.white)
            if let author = new.author {
                Text("By: \(author)")
                    .foregroundStyle(.white.opacity(0.5))
            }
            if let imageUrl = new.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }placeholder: {
                    ProgressView()
                }
            }
            if let description = new.description{
                Text(description)
                    .foregroundStyle(Color.white.opacity(0.75))
            }
            HStack{
                if let publishedAt = new.publishedAt {
                    Text("Published At: \(publishedAt.prefix(10))")
                        .font(Font.caption.weight(.ultraLight))
                        .foregroundStyle(Color.white.opacity(0.90))
                }
                Spacer()
                Button(action:{
                    showWebView = true
                }){
                    Text("Read More")
                        .foregroundStyle(Color(.blue))
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            
        )
        .padding()
        .sheet(isPresented: $showWebView){
            if let url = URL(string:new.url){
                WebView(url: url)
            }else{
                Text("Invalid URL")
            }
        }
        .background(Color(red: 52/255, green: 53/255, blue: 65/255))
    }
}

#Preview {
    let sampleNew = ArticleModel(
        author: "Paul Tossi",
        title: "Here's When 'Path Of Exile 2' May Come Out Early Access - Udemy",
        url: "https://www.forbes.com/sites/paultassi/2025/01/04/heres-when-path-of-exile-2-may-come-out-of-early-access/",
        description: "Based on what we know, here is when Path of Exile 2 may leave Early Access and launch as a completed game",
        urlToImage: "https://www.gamespot.com/a/uploads/screen_kubrick/1647/16470614/4149843-pathofexile2summergamefesttrailer.jpg",
        publishedAt: "2025-01-04T17:00:00Z",
        content: nil,
        source: SourceModel(id: nil, name: "Forbes")
    )
    NewsView(new: sampleNew)
}
