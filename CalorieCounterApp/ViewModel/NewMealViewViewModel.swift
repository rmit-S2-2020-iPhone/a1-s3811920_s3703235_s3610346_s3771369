//
//  NewMealViewViewModel.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import UIKit

enum ViewModelState {
    case isEmpty
    case isMissingValue
    case notEmpty
}

class NewMealViewViewModel {
    
    var id: String = "" {
        didSet {
            didUpdateId?(id)
        }
    }
    
    var name: String = "" {
        didSet {
            didUpdateName?(name)
        }
    }
    
    var calories: Float = 0 {
        didSet {
            caloriesAsString = String(format: "%.0f kcal", calories)
        }
    }
    
    var caloriesAsString: String = "" {
        didSet {
            didUpdateCaloriesString?(caloriesAsString)
        }
    }
    
    var fat: Float = 0 {
        didSet {
            fatAsString = String(format: "%.0f g", fat)
        }
    }
    
    var fatAsString: String = "" {
        didSet {
            didUpdateFatString?(fatAsString)
        }
    }
    
    
    var didUpdateId: ((String) -> ())?
    var didUpdateName: ((String) -> ())?
    var didUpdateCaloriesString: ((String) -> ())?
    var didUpdateFatString: ((String) -> ())?
    
  
    private lazy var nutritionixAPI = NutritionixAPI()
    
    
    func toMeal() -> Mealx? {
        
        if (self.state() == .isEmpty || self.state() == .isMissingValue) {
            return nil
        }
        
        return Mealx(id: id, name: name, calories: calories, fat: fat)
    }
    
    func state() -> ViewModelState {
        let hasId = id.isEmpty ? false : true
        let hasNameValue = (name.isEmpty && name != "Name of Food / Dish") ? false : true
        let hasCaloriesValue = caloriesAsString.isEmpty ? false : true
        let hasFatValue = fatAsString.isEmpty ? false : true
        
        if (!hasId && !hasNameValue && !hasCaloriesValue && !hasFatValue) {
            return .isEmpty
        }
        else if (hasId && hasNameValue && hasCaloriesValue && hasFatValue) {
            return .notEmpty
        }
        return .isMissingValue
    }
    
    func getMeal(meal: String){
//            nutritionixAPI.nutritionInfo(foodName: meal) { (meals, error) in
//                if let error = error {
//                    print("Error forwarding meals (\(error)")
//                }
//            }
        }
}
