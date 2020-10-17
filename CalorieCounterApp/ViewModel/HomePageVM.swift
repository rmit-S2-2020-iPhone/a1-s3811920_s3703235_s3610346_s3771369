//
//  HomePageVM.swift
//  CalorieCounterApp
//
//

import Foundation

class HomePageVM: NSObject {
    
    
    typealias requestCallBack = (_ status:Bool,_ messaage:String) ->Void
    typealias getSumCaloriesCallBack = (_ mealsD:Int64) -> Void
    
    var nutritionCallBack:getSumCaloriesCallBack?
    var responseCallBack:requestCallBack?
    
    func getSumCalories(){
        let sum = DMealsCoreService.retrieveSumCalories()
        self.nutritionCallBack?(sum)
    }
    
    func requestCompletionHandler(callback:@escaping requestCallBack){
        self.responseCallBack = callback
    }
    func sumCalCompletionHandler(callback:@escaping getSumCaloriesCallBack){
        self.nutritionCallBack = callback
    }
    
}
