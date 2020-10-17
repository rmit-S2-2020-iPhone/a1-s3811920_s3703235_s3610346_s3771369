//
//  CalorieCounterAppUITests.swift
//  CalorieCounterAppUITests
//
//  Created by Abida Mohammadi on 30/7/20.
//

import XCTest

class CalorieCounterAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testValidSignUpSuccess(){
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Go To Dashboard"]/*[[".buttons[\"Go To Dashboard\"].staticTexts[\"Go To Dashboard\"]",".staticTexts[\"Go To Dashboard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.textFields["John Smith"].exists)
        app.textFields["John Smith"].tap()
        app.textFields["John Smith"].typeText("Timal")
        
        let doneButton = app.toolbars["Toolbar"].buttons["Done"]
        doneButton.tap()
        app.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["2020"]/*[[".pickers.pickerWheels[\"2020\"]",".pickerWheels[\"2020\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        XCTAssertTrue(app.textFields["80 kg"].exists)
        app.textFields["80 kg"].tap()
        app.textFields["80 kg"].typeText("80")
        
        doneButton.tap()
        XCTAssertTrue(app.textFields["158 cm"].exists)
        app.textFields["158 cm"].tap()
        app.textFields["158 cm"].typeText("158")
        doneButton.tap()
        app.buttons["Male"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        app.buttons["Maintain Weight"].tap()
        nextButton.tap()
        app.buttons["Sedentary"].tap()
        app.buttons["Finish"].tap()
        
    }
    
    func testValidSearchSuccess(){
        
        let app = XCUIApplication()
        app.buttons["Go To Dashboard"].tap()
        app.buttons["Add Breakfast"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .other).element(boundBy: 1).children(matching: .searchField).element.tap()
        tablesQuery.children(matching: .other).element(boundBy: 1).children(matching: .searchField).element.typeText("Rice")
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup"]/*[[".cells.staticTexts[\"Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup\"]",".staticTexts[\"Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["CalorieCounterApp.MealDetail"].buttons["Back"].tap()
        
    }
    func testValidAddToMealSuccess(){
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Go To Dashboard"]/*[[".buttons[\"Go To Dashboard\"].staticTexts[\"Go To Dashboard\"]",".staticTexts[\"Go To Dashboard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Add Breakfast"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .other).element(boundBy: 1).children(matching: .searchField).element.tap()
        tablesQuery.children(matching: .other).element(boundBy: 1).children(matching: .searchField).element.typeText("Rice")
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup"]/*[[".cells.staticTexts[\"Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup\"]",".staticTexts[\"Breakfast-Rice, white, long-grain, regular, unenriched, cooked without salt - 1 cup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Add to meal"].tap()
        app.alerts["Alert"].scrollViews.otherElements.buttons["OK"].tap()
        app.navigationBars["CalorieCounterApp.MealDetail"].buttons["Back"].tap()
        app.navigationBars["CalorieCounterApp.Search"].buttons["Back"].tap()
        
    }
    
    func testUploadImageSuccess(){
        
        
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
