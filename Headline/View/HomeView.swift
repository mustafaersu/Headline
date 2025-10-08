//
//  HomeView.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject private var Homevm = HomeVM()
    @State private var category: String = "Technology"
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            TextField("", text: $searchText, prompt: Text("Search News..")
                .foregroundColor(.gray)) // placeholder rengi
                .padding(10)
                .background(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                .foregroundColor(.white)
                .padding(.horizontal)
                .onChange(of: searchText){newValue in
                    let trimmed = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                    if trimmed.isEmpty{
                        Homevm.newsCategory = category
                        Homevm.getCategoryNews()
                    }else{
                        Homevm.getSearchNews(query: trimmed)
                    }
                }
            Picker("", selection: $category){
                Text("Tech").tag( "Technology")
                Text("Sport").tag( "Sports")
                Text("Science").tag( "Science")
                Text("Business").tag( "Business")
                Text("Health").tag( "Health")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .onChange(of: category) { newValue in
                searchText = ""
                Homevm.newsCategory = newValue
                Homevm.getCategoryNews()
            }
            ScrollView{
                Spacer().frame(height:40)
                ForEach(Homevm.newsList,id:\.self){new in
                    NewsView(new: new)
                }
            }
        }
        .background(Color(red: 52/255, green: 53/255, blue: 65/255))
        .onAppear{
            Homevm.newsCategory = category
            Homevm.getCategoryNews()
        }
    }
}
#Preview {
    HomeView()
}
