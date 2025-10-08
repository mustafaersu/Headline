//
//  APICall.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import Foundation

enum apiError:Error{
    case invalidURL
    case invalidResponse
    case parsingError
}

class APICall{
    static let shared = APICall()
    let apiKey = "7c2381961134410b9f73be0fb8a8a6a3"
    let baseURL = "https://newsapi.org/v2"
    
    func getNewsWithCategory(Category:String,completion: @escaping (Result<ResponseModel,apiError>) -> Void){
        guard let url = URL(string: "\(baseURL)/top-headlines?country=us&category=\(Category)&apiKey=\(apiKey)") else {
            print("URL error, try again later")
            return completion(.failure(.invalidURL))
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else{
                print("No Data")
                return completion(.failure(.invalidResponse))
            }
            guard let news = try? JSONDecoder().decode(ResponseModel.self, from: data) else {
                print("Decoding Failed")
                return completion(.failure(.parsingError))
            }
            return completion(.success(news))
        }
        task.resume()
    }
    func getNewsWithSearch(Query:String,completion: @escaping (Result<ResponseModel,apiError>) -> Void){
        guard let url = URL(string: "\(baseURL)/everything?q=\(Query)&apiKey=\(apiKey)") else {
            print("URL error, try again later")
            return completion(.failure(.invalidURL))
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else{
                print("No Data")
                return completion(.failure(.invalidResponse))
            }
            if let res = String(data: data, encoding: .utf8){
                print(res)
            }
            guard let news = try? JSONDecoder().decode(ResponseModel.self, from: data) else {
                print("Decoding Failed")
                return completion(.failure(.parsingError))
            }
            return completion(.success(news))
        }
        task.resume()
    }
}
