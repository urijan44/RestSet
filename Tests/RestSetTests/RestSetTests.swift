//
//  RestSetTests.swift
//
//
//  Created by leehs81 on 2022/12/07.
//

import XCTest
@testable import RestSet

final class RestSetTests: XCTestCase {


    func testExample() throws {
        let restSet = RestSet<Int>(interval: 1)
        
        restSet.insert(1)
        var result = false
        let exp = expectation(description: "1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            result = restSet.contains(1)
            exp.fulfill()
        }
        
        let exp2 = expectation(description: "2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            result = restSet.contains(1)
            exp2.fulfill()
        }
        
        let exp3 = expectation(description: "3")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            result = restSet.contains(1)
            exp3.fulfill()
        }
        
        let exp4 = expectation(description: "4")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            result = restSet.isEmpty
            exp4.fulfill()
        }
        
        wait(for: [exp, exp2, exp3, exp4], timeout: 1.5)
        XCTAssertTrue(result)
    }
    
    func test_multiple() throws {
        let restSet = RestSet<Int>(interval: 1)
        
        restSet.insert(1)
        var result = false
        let exp = expectation(description: "1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            result = !restSet.isEmpty
            exp.fulfill()
        }
        
        let exp2 = expectation(description: "2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            result = !restSet.isEmpty
            exp2.fulfill()
        }
        
        let exp3 = expectation(description: "3")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            result = !restSet.isEmpty
            restSet.insert(2)
            exp3.fulfill()
        }
        
        let exp4 = expectation(description: "4")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            result = !restSet.isEmpty
            exp4.fulfill()
        }
        
        let exp5 = expectation(description: "5")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            result = restSet.isEmpty
            exp5.fulfill()
        }
        
        wait(for: [exp, exp2, exp3, exp4, exp5], timeout: 2.2)
        XCTAssertTrue(result)
    }
}
