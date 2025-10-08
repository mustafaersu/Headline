//
//  ArticleModel.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import Foundation

struct ArticleModel:Codable,Hashable,Equatable{
    var author:String?
    var title:String
    var url:String
    var description:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    var source:SourceModel
}
