//
//  FirebaseManager.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    private let db = Firestore.firestore()
    private let deviceID = getDeviceID()

    func saveArticle(_ article: ArticleDetailViewModel, completion: @escaping (Error?) -> Void) {
        let articleData: [String: Any] = [
            "title": article.title,
            "author": article.author,
            "publishedAt": article.publishedAt,
            "description": article.description,
            "deviceID": deviceID
        ]

        db.collection("favorites").addDocument(data: articleData) { error in
            completion(error)
        }
    }

    func fetchFavoriteArticles(completion: @escaping ([ArticleDetailViewModel]?, Error?) -> Void) {
        db.collection("favorites").whereField("deviceID", isEqualTo: deviceID).getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                var articles = [ArticleDetailViewModel]()
                for document in snapshot?.documents ?? [] {
                    let data = document.data()
                    if let title = data["title"] as? String,
                       let author = data["author"] as? String,
                       let publishedAt = data["publishedAt"] as? String,
                       let description = data["description"] as? String {
                        // Create a NewsArticle object
                        let newsArticle = NewsArticle(author: author, title: title, description: description, publishedAt: publishedAt)
                        // Create an ArticleDetailViewModel with the NewsArticle
                        let articleViewModel = ArticleDetailViewModel(newsArticle)
                        articles.append(articleViewModel)
                    }
                }
                completion(articles, nil)
            }
        }
    }
}
