//
//  UserDefaultsViewModelTests.swift
//  NewsAppForMeTests
//
//  Created by Jigneshkumar Patil on 2024/01/15.
//

import Foundation

class MyViewModelTests: XCTestCase {
    var viewModel: UserDefaultsViewModel!
    var mockUserDefaultsService: MockUserDefaultsService!

    override func setUp() {
        super.setUp()
        mockUserDefaultsService = MockUserDefaultsService()
        viewModel = MyViewModel(userDefaultsService: mockUserDefaultsService)
    }

    func testSaveString() {
        viewModel.saveString(value: "Test", forKey: "TestKey")
        XCTAssertEqual(mockUserDefaultsService.getValue(forKey: "TestKey"), "Test")
    }
}
