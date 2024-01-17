//
//  BehavioralActivationTests.swift
//  BehavioralActivationTests
//
//  Created by Peter Hartnett on 1/16/24.
//

import XCTest
@testable import BehavioralActivation

final class BehavioralActivationTests: XCTestCase {
    
    func testCreateActvitivy() throws {
        let newActivity = Activity(title: "Test Title", detail: "Test Detail")
        XCTAssertEqual(newActivity.title, "Test Title")
        XCTAssertEqual(newActivity.detail, "Test Detail")
    }
    
    func testDeleteAllActivities() throws{
        //populate SwiftData with a bunch of dummy data
        //check its there
        //delete all the dummydata
        //make sure its not there
    }

    

}
