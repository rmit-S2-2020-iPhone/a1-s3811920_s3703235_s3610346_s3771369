//
//  MealDetailsModel.swift
//  CalorieCounterApp
//
//  Created by Hamza Arif on 10/10/2020.
//

import Foundation

class MealDetailsModel{
    
    var id : Int64?
    var type : String?
    var name : String?
    var serving : String?
    var qty : Int64?
    var calories: Int64?
    
    init(id:Int64,type:String,name:String,serving:String,qty:Int64,cal:Int64){
        self.id = id
        self.type = type
        self.name = name
        self.serving = serving
        self.qty = qty
        self.calories = cal
    }
    
}
