//
//  MealViewViewModel.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation

struct MealViewViewModel {
    
    var meal: Mealx
    
    
    var id: String {
        return meal.id
    }
    
    var name: String {
        return meal.name
    }
    
    var calories: Float {
        return meal.calories
    }
    
    var caloriesAsString: String {
        return String(meal.calories)
    }
    
    var fat: Float {
        return meal.fat
    }
    
    var fatAsString: String {
        return String(meal.fat)
    }
    
}
