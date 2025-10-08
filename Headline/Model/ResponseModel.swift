//
//  ResponseModel.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import Foundation

struct ResponseModel:Codable{
    var status: String
    var totalResults: Int
    var articles: [ArticleModel]
}
