//
//  Constants.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://newsapi.org/v2/top-headlines"
        static let apiKey = "1d38baf2f91547a28752a9a255b59779"
    }

    struct UserDefaultsKeys {
        static let darkMode = "isDarkMode"
        static let language = "Language"
    }

    struct UI {
        static let defaultPadding = 16.0
        static let animationDuration = 0.3
    }

}
