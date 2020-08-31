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
        meals.append(Meal("chicken quesadilla","1.0","119kcal","24.74","1.78","0.98","1.28","2.39","0.34"))
        meals.append(Meal("burritos","1.0","119kcal","12.54","1.58","0.38","1.58","2.39","0.94"))
        meals.append(Meal("quesadillas","1.0","119kcal","24.74","1.78","0.98","1.28","2.39","0.04"))
        meals.append(Meal("fajitas","1.0","102kcal","34.74","1.32","0.98","1.28","2.39","0.34"))
        meals.append(Meal("sushi","1.0","99kcal","34.74","1.38","0.80","1.28","2.39","0.34"))
        meals.append(Meal("kebab","1.0","97kcal","24.74","1.55","0.18","1.28","2.39","0.34"))
        meals.append(Meal("chicken wings","1.0","100kcal","24.74","1.78","0.98","1.28","2.32","0.54"))
        meals.append(Meal("fish tacos","1.0","89kcal","17.98","1.23","0.68","2.08","2.00","0.03"))
        meals.append(Meal("salmon patties","1.0","98kcal","23.74","1.28","0.18","1.23","1.49","0.3"))
        meals.append(Meal("chicken pasta","1.0","107kcal","21.14","0.12","0.88","0.38","3.90","0.35"))
        meals.append(Meal("tuscan Bean Soup","1.0","103kcal","14.24","2.11","1.08","0.18","1.09","0.34"))
        meals.append(Meal("chicken Skillet","1.0","109kcal","12.00","0.99","0.88","2.24","3.65","1.34"))
        meals.append(Meal("kabuli pulao","1.0","118kcal","20.74","1.18","1.10","0.18","1.29","0.14"))
        meals.append(Meal("Plov","1.0","111kcal","22.77","0.77","0.43","2.23","3.32","1.44"))
        meals.append(Meal("tortellini soup","2.0","112kcal","23.74","0.79","1.88","1.18","1.99","0.94"))
        meals.append(Meal("crab cakes","1.0","111kcal","22.74","0.78","0.88","1.68","1.39","0.94"))
        
        return meals
    }
}
