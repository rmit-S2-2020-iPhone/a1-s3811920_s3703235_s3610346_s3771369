//
//  MealPageVM.swift
//  CalorieCounterApp
//
//  Created by Hamza Arif on 09/10/2020.
//

import Foundation
import UIKit

class MealPageVM : NSObject{
    
    
    typealias requestCallBack = (_ status:Bool,_ messaage:String) ->Void
    typealias getNutritionCallBack = (_ mealsD:MealDetailFields) -> Void
    
    var nutritionCallBack:getNutritionCallBack?
    var responseCallBack:requestCallBack?
    
    func checkMeal(name:String){
        if(DMealsCoreService.checkMeal(name: name)){
            self.responseCallBack?(true,"Meal Details Already Exists")
        }
    }
    
    func addNutritionDetail(type:String,type_id:Int64,name:String,serving:String,qty:Int64,cal:Int64){
         let mealdid = DMealsCoreService.incrementID()
        if(DMealsCoreService.createMealDetail(id: mealdid, type_id: type_id, type:type, name: name, serving: serving, qty: qty, cal: cal)){
             self.responseCallBack?(true,"Meal Detail Successfully Added")
         }else{
             self.responseCallBack?(false,"Something went wrong")
         }
    }
    
    func getNutritionDetail(query:String){
        if(Connectivity.isConnectedToInternet()){
            NutritionixAPI.getNutritionDetils(query: query){returnJSON,error in
                if error != nil{
                    self.responseCallBack?(false,"Something went wrong")
                }else{
                    if((returnJSON?.hits!.count)! > 0){
                        self.nutritionCallBack?((returnJSON?.hits![0].fields)!)
                    }else{
                        self.responseCallBack?(false,"No Data Found")
                    }
                }
            }
        }else{
            self.responseCallBack?(false, "Please check your internet connection!!!")
        }
    }
    
    func requestCompletionHandler(callback:@escaping requestCallBack){
        self.responseCallBack = callback
    }
    func nutritionCompletionHandler(callback:@escaping getNutritionCallBack){
        self.nutritionCallBack = callback
    }
    
}
