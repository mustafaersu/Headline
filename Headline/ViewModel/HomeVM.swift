//
//  HomeVM.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import Foundation
import Combine

class HomeVM:ObservableObject{
    @Published var newsCategory = "Technology"
    @Published var newsList: [ArticleModel] = []
    var APICallObject = APICall()
    
    func getCategoryNews(){
        APICallObject.getNewsWithCategory(Category: newsCategory){
            result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let response):
                    DispatchQueue.main.async {
                        self.newsList = response.articles
                    
                }
            }
        }
    }
    func getSearchNews(query:String){
        APICallObject.getNewsWithSearch(Query: query){
            result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let response):
                    DispatchQueue.main.async {
                        self.newsList = response.articles
                    
                }
            }
        }
    }
}
