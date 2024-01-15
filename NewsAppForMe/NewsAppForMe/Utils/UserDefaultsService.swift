//
//  UserDefaultsService.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

class UserDefaultsService: UserDefaultsServiceProtocol {
    func save(value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getValue(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
}

