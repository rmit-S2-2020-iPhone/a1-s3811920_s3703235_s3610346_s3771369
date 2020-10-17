//
//  AddedMealVM.swift
//  CalorieCounterApp
//
//

import Foundation


class AddedMealVM : NSObject{
    
    typealias getMealDetailsCallBack = (_ meals:[MealDetailsModel]) -> Void
    
    var mealDetailsCallBack:getMealDetailsCallBack?
    
    func getMealsDetails(){
        let meals = DMealsCoreService.retrieveAllMeals()
        self.mealDetailsCallBack?(meals)
    }
    
    
    func mealDetailsCompletionHandler(callback:@escaping getMealDetailsCallBack){
        self.mealDetailsCallBack = callback
    }
}
