//
//  CardModel.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation

class MealsModel{
    
    var id : Int64?
    var mealtype : String?
    var mealname : String?
    
    init(id:Int64,mealtype:String,mealname:String){
        self.id = id
        self.mealtype = mealtype
        self.mealname = mealname
    }
    
}


