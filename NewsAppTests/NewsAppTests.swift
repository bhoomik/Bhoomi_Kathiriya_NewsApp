//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Bhoomi Kathiriya on 20/10/18.
//  Copyright © 2018 Bhoomi Kathiriya. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    private var newsService : NewsService = NewsService()

    let strURL = String(format: "%@%@",kBaseURL,kAPIKey)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testParsing() {
        
        let expectation2 = expectation(description: "Parsing Succeeds")
        
        
        newsService.createRequest(qMes: "", strURL: strURL, method: "GET", completionBlock: { (arg0) in
            expectation2.fulfill()
            let (output) = arg0
            print("test case output",output)
        }, andFailureBlock: { (failure) in
            XCTFail()
        })
        waitForExpectations(timeout: 600.0) { (_) -> Void in
        }
        
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
