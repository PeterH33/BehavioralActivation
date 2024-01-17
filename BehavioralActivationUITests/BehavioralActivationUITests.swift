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
        // assigns launch arg for use in BehavioralActivationApp.swift init
        app.launchArguments = ["enable-testing"]
        
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    ///This test is simply to make sure that navigation is working properly
    func testNavigationMenu(){
        //Make sure that we start on the home page which is the button to pick an activity right now
        let pickActivityButton = app.buttons["pickActivityButton"]
        XCTAssert(pickActivityButton.exists)
        
        //Make sure that the tabs for navigation exist
        let pickActivityNavButton = app.buttons["pickActivityNav"]
        let activityListNavButton = app.buttons["createActivityNav"]
        XCTAssert(pickActivityNavButton.exists)
        XCTAssert(activityListNavButton.exists)
        
        //Navigate to the activity list
        activityListNavButton.tap()
        
        //make sure that the button for creating an Activity exists and that we do not see the home page any more
        let createActivityButton = app.buttons["createActivityButton"]
        XCTAssert(createActivityButton.exists)
        XCTAssertFalse(pickActivityButton.exists)
        
        //Check that list is empty, a section heading counts as a cell
        XCTAssertEqual(app.cells.count, 1)
        
        //navigate to the create Activity view from the Activity list view
        createActivityButton.tap()
        
        //Check that textfields for Activity Name/Title and Details exist
        let activityNameTextField = app.textFields["activityNameTextField"]
        let activityDetailTextField = app.textFields["activityDetailsTextField"]
        XCTAssert(activityNameTextField.exists)
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
        
        //Check that a new Activity added exists in ActivityListView
        XCTAssertEqual(app.cells.count, 2)
        let newDataInList = app.cells.element(boundBy: 1)
        //previous version checked by the information displayed in a textfield, just checking that Something was added now
//        let newDataInList = app.staticTexts["Test Name"]
        XCTAssert(newDataInList.exists)
        
        //Check for edit button
        newDataInList.swipeRight()
        let editButton = app.buttons["Edit"]
        XCTAssert(editButton.exists)
        
        //Nav to edit Activity
        editButton.tap()
        XCTAssert(activityNameTextField.exists)
        XCTAssert(activityDetailTextField.exists)
        
        //Make sure that the edit menu loaded the item
        XCTAssertEqual(activityNameTextField.value as! String, "Test Name")
        XCTAssertEqual(activityDetailTextField.value as! String, "Test Details")
        
        //back to main menu
        let backButton = app.buttons["Back"]
        backButton.tap()
        
        //delete the item from the list
        newDataInList.swipeLeft()
        let deleteButton = app.buttons["Delete"]
        deleteButton.tap()
        //make sure the new item is gone
        XCTAssertFalse(newDataInList.exists)
        
        //Nav back to home page
        pickActivityNavButton.tap()
        XCTAssert(pickActivityButton.exists)
    }
    

}
