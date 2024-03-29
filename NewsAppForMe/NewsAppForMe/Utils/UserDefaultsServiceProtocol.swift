//
//  UserDefaultsServiceProtocol.swift
//  NewsAppForMe
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

protocol UserDefaultsServiceProtocol {
    func save(value: String, forKey key: String)
    func getValue(forKey key: String) -> String?
}
