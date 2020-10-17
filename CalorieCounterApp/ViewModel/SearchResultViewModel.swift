//
//  SearchResultViewModel.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation

class SearchResultViewModel: NSObject{
   
    var meals:MealsModel!
    
    var mealtype:String {
        return meals.mealtype!
    }
    var mealname:String {
        return meals.mealname!
    }
    
    typealias addMealCallBack = (_ status:Bool,_ messaage:String) ->Void
    typealias getMealsByTypeCallBack = (_ meals:[MealsModel]) -> Void
    
    var mealCallBack:addMealCallBack?
    var mealsTypeCallBack:getMealsByTypeCallBack?
    
    //Add new meal
    func addMeal(mealtype:String,mealname:String){
        if(mealtype != ""){
            if(mealname != ""){
                let mealid = MealsCoreService.incrementID()
                if(MealsCoreService.createMeal(id: mealid, mealtype: mealtype, mealname: mealname)){
                    self.mealCallBack?(true,"Meal Successfully Added")
                }else{
                    self.mealCallBack?(false,"Something went wrong")
                }
            }else{
                self.mealCallBack?(false,"Please enter meal name")
            }
        }else{
            self.mealCallBack?(false,"Meal type must be select first.")
        }
    }
    
    func searchMeal(query:String){
        let meals = MealsCoreService.searchMeal(text: query)
        self.mealsTypeCallBack?(meals)
    }
    
    func getMealsByType(type:String){
        let meals = MealsCoreService.retrieveMealsByType(type: type)
        self.mealsTypeCallBack?(meals)
    }
    
    
    //Meals Completion Handler
    func mealCompletionHandler(callback:@escaping addMealCallBack){
        self.mealCallBack = callback
    }
    
    //AllMeals Completion Handler
    func mealsTypeCompletionHandler(callback:@escaping getMealsByTypeCallBack){
        self.mealsTypeCallBack = callback
    }
  
}



