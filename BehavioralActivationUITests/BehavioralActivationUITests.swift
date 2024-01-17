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

    ///This test is simply to make sure that navigation is working properly
    func testNavigationMenu(){
        let pickActivityButton = app.buttons["pickActivityButton"]
        XCTAssert(pickActivityButton.exists)
        
        let createActivityButton = app.buttons["createActivityButton"]
        
        let pickActivityNavButton = app.buttons["pickActivityNav"]
        XCTAssert(pickActivityNavButton.exists)
        
        let activityListNavButton = app.buttons["createActivityNav"]
        XCTAssert(activityListNavButton.exists)
        
        //Navigate to the activity list
        activityListNavButton.tap()
        XCTAssert(createActivityButton.exists)
        XCTAssertFalse(pickActivityButton.exists)
        
        //navigate to the create Activity view from the Activity list view
        createActivityButton.tap()
        let activityNameTextField = app.textFields["activityNameTextField"]
        XCTAssert(activityNameTextField.exists)
        let activityDetailTextField = app.textFields["activityDetailsTextField"]
        XCTAssert(activityDetailTextField.exists)
        
        //test adding information
        activityNameTextField.tap()
        activityNameTextField.typeText("Test Name")
        XCTAssertEqual(activityNameTextField.value as! String, "Test Name")
        activityDetailTextField.tap()
        activityDetailTextField.typeText("Test Details")
        XCTAssertEqual(activityDetailTextField.value as! String, "Test Details")
        app.keyboards.buttons["Return"].tap()
        
        //Submit new activity
        let doneButton = app.buttons["Done"]
        XCTAssert(doneButton.exists)
        doneButton.tap()
        XCTAssertFalse(doneButton.waitForExistence(timeout: 0.5))
        
        //Check that new Activity exists in ActivityListView
        let newDataInList = app.staticTexts["Test Name"]
        XCTAssert(newDataInList.exists)
        
        
        pickActivityNavButton.tap()
        XCTAssert(pickActivityButton.exists)
    }
    

}
