//
//  walrus_testTests.swift
//  walrus-testTests
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import XCTest
@testable import walrus_test

class walrus_testTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_API_with_ValidRequest_ReturnsVehicelArray() {
        // Arrangements
        let expectation = self.expectation(description: "test_API_with_ValidRequest_ReturnsVehicelArray")
        let viewModel = NewsViewModel()
        
        //Act
        viewModel.getTopHighlights(forCountry: "us") {(result) in
           //Assert
            XCTAssertNotNil(result)  // JSON Parse Success
            XCTAssertNotNil(result.articles) // List Parsed
            XCTAssert(result.articles!.count > 0) //List Contains Elements
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
