//
//  Meal.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation

class Meal {
    var name: String!
    var serving: String!
    var calories: String!
    var carbohydrate: String!
    var protein: String!
    var fat: String!
    var vitaminA: String!
    var vitamicC: String!
    var iron: String!
    
    init(_ name: String,_ serving: String, _ calories: String, _ carbohydrate: String, _ protein: String,
         _ fat: String, _ vitaminA: String, _ vitaminC: String, _ iron: String) {
        self.name = name
        self.serving = serving
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
        self.vitaminA = vitaminA
        self.vitamicC = vitaminC
        self.iron = iron
    }
}
