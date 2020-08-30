//
//  SearchResultViewModel.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation

class MealsListViewModel{
    var mealViewModel: [MealViewModel] = [MealViewModel]()
    var filterViewModel: [MealViewModel] = [MealViewModel]()
    
    private var mealData: MockData
    
    init(mealData: MockData){
        self.mealData = mealData
        populateMeals()
    }
    
    private func populateMeals() {
        let meals = self.mealData.getAllMeals()
        self.mealViewModel = meals.map { meal in
            return MealViewModel(meal)
        }
    }
    
    public func addFilteredMeals(_ meal: MealViewModel){
        filterViewModel.append(meal)
    }
}


class MealViewModel {
    var mealName: String!
    
    init(_ meal: Meal){
        self.mealName = meal.name
    }
}
