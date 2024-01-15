//
//  Webservices.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

class Webservices {
    
    func getArticles(url: URL, completion: @escaping ([NewsArticle]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let newsArticleList = try? JSONDecoder().decode(NewsResponse.self, from: data)
                
                if let newsArticleList = newsArticleList {
                    completion(newsArticleList.articles)
                }
            }
            
        }.resume()
    }
}


