//
//  CalorieCounterAppTests.swift
//  CalorieCounterAppTests
//
//  Created by Abida Mohammadi on 30/7/20.
//

import XCTest
@testable import CalorieCounterApp

class CalorieCounterAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetNutiritionSuccessReturnsMeals() {
        
        let fieldsExpectation = expectation(description: "fields")
        var mealsResponse: [MealDetailHits]?
        //Api request testcase
        NutritionixAPI.getNutritionDetils(query: "Rice") { (meals, error) in
            mealsResponse = meals?.hits
            fieldsExpectation.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(mealsResponse)
        }
    }
    func testAddMealSuccess(){
        let create = DMealsCoreService.createMealDetail(id: DMealsCoreService.incrementID(), type_id: 0, type: "Breakfast", name: "Rice", serving: "1", qty: 1, cal: 200)
        XCTAssertNotNil(create)
    }
    func testFetchAllMeals(){
        let meals = DMealsCoreService.retrieveAllMeals()
        XCTAssertGreaterThan(meals.count, 0)
    }
    func testGetUser(){
        let users = UsersCoreService.retrieveUsers()
        XCTAssertEqual(users.count, 1)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
