//
//  MockData.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation

class MockData {
    func getAllMeals() -> [Meal]{
        
        var meals = [Meal]()
        meals.append(Meal("chicken quesadilla"))
        meals.append(Meal("burritos"))
        meals.append(Meal("quesadillas"))
        meals.append(Meal("fajitas"))
        meals.append(Meal("sushi"))
        meals.append(Meal("kebab"))
        meals.append(Meal("chicken wings"))
        meals.append(Meal("fish tacos"))
        meals.append(Meal("salmon patties"))
        meals.append(Meal("chicken pasta"))
        meals.append(Meal("tuscan Bean Soup"))
        meals.append(Meal("chicken Skillet"))
        meals.append(Meal("kabuli pulao"))
        meals.append(Meal("Plov"))
        meals.append(Meal("tortellini soup"))
        meals.append(Meal("crab cakes"))
        
        return meals
    }
}
