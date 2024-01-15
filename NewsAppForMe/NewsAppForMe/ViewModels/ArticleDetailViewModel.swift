//
//  ArticleDetailViewModel.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

struct NewsArticleListViewModel {
    let newsArticle: [NewsArticle]
}

extension NewsArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.newsArticle.count
    }
    
    func newsArticleAtIndex(_ index: Int) -> ArticleDetailViewModel {
        let newsArticle = self.newsArticle[index]
        return ArticleDetailViewModel(newsArticle)
    }
}

struct ArticleDetailViewModel {
    private let newsArticle: NewsArticle
    
}

extension ArticleDetailViewModel {
    init(_ newsArticle: NewsArticle){
        self.newsArticle = newsArticle
    }
}

extension ArticleDetailViewModel {
    
    var title: String {
        return self.newsArticle.title
    }
    
    var description: String {
        return self.newsArticle.description ?? "No Description available"
    }
    
    var author: String {
            return newsArticle.author ?? "Unknown Author"
        }
        
    var publishedAt: String {
        return newsArticle.publishedAt
    }
}

// MARK: - Save to Firebase
extension ArticleDetailViewModel {
    func addToFavorites(completion: @escaping (Error?) -> Void) {
       
    }
}

