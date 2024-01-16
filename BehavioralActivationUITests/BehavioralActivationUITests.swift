//
//  BehavioralActivationUITests.swift
//  BehavioralActivationUITests
//
//  Created by Peter Hartnett on 1/16/24.
//

import XCTest

final class BehavioralActivationUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationMenu(){
        let pickActivityView = app.staticTexts["Pick Activity View"]
        XCTAssert(pickActivityView.exists)
        
        let pickActivityNavButton = app.buttons["pickActivityNav"]
        XCTAssert(pickActivityNavButton.exists)
        
        let createActivityNavButton = app.buttons["createActivityNav"]
        XCTAssert(createActivityNavButton.exists)
    }
    

}
