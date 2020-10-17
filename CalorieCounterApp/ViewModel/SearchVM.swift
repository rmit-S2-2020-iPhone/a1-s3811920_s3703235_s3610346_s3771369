//
//  SearchVM.swift
//  CalorieCounterApp
//
//  Created by Hamza Arif on 10/10/2020.
//

import Foundation
import UIKit

class SearchVM : NSObject{
    
    
    typealias requestCallBack = (_ status:Bool,_ messaage:String) ->Void
    typealias getNutritionCallBack = (_ mealsD:[MealDetailHits]) -> Void
    
    var nutritionCallBack:getNutritionCallBack?
    var responseCallBack:requestCallBack?
    
    func getNutritionDetail(query:String){
        if(Connectivity.isConnectedToInternet()){
            NutritionixAPI.getNutritionDetils(query: query){returnJSON,error in
                if error != nil{
                    self.responseCallBack?(false,"Something went wrong")
                }else{
                    if((returnJSON?.hits!.count)! > 0){
                        self.nutritionCallBack?((returnJSON?.hits)!)
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
