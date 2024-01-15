//
//  MockUserDefaultsService.swift
//  NewsAppForMeTests
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

class MockUserDefaultsService: UserDefaultsServiceProtocol {
    var store: [String: String] = [:]

    func save(value: String, forKey key: String) {
        store[key] = value
    }

    func getValue(forKey key: String) -> String? {
        store[key]
    }
}
