//
//  NewsArticles.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

struct NewsArticle: Decodable {
    let author: String?
    let title: String
    let description: String?
    let publishedAt: String
}

struct Source: Decodable {
    let id: String?
    let name: String
}

