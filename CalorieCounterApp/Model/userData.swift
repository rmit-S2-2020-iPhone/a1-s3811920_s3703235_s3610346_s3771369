//
//  userData.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 23/8/20.
//

import Foundation

class userData {
    
    var name:String
    var dateOfBirth:Date
    var currentWeight:Double
    var currentHeight:Double
    
    init(name:String, dateOfBirth:Date, currentWeight:Double, currentHeight:Double) {
        
        self.name = name
        self.dateOfBirth = dateOfBirth
        
        
        self.currentWeight = currentWeight
        self.currentHeight = currentHeight
    }
    
    func getName () -> String {
        return (name)
        
    }

    
    
}

