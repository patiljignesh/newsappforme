//
//  userDefaultsViewModel.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

class UserDefaultsViewModel  {
    private let userDefaultsService: UserDefaultsServiceProtocol

        init(userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService()) {
            self.userDefaultsService = userDefaultsService
        }

        func setLanguagePreference(to language: String) {
            userDefaultsService.save(value: language, forKey: "Language")
        }
    
        func saveString(value: String, forKey key: String) {
            userDefaultsService.save(value: value, forKey: key)
        }

        func getString(forKey key: String) -> String? {
            userDefaultsService.getValue(forKey: key)
        }
}
