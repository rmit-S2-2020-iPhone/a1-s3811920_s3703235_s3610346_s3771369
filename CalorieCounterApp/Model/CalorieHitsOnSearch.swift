//
//  CalorieHitsOnSearch.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 5/10/20.
//

import Foundation

class CalorieHitsOnSearch
{
    
    
    let itemName: String?
    let brandName: String?
    let nfCalories: Double?
    let servingSize: Int?
    let servingUnit: String?
    
    // assigning the keys so if the API provider changes the key, its easy for us to change just the key accourdinly.
    struct calorieKeys {
        static let itemName     = "itemName"
        static let brandName    = "brandName"
        static let nfCalories   = "nfCalories"
        static let servingSize  = "servingSize"
        static let servingUnit  = "servingUnit"
        
    }
    
    init(CalorieHitsOnSearch: [String : Any]) {
        
        if let itemNameOut = CalorieHitsOnSearch[calorieKeys.itemName] as? String {
            itemName = itemNameOut
        }
        else {itemName = nil}
        
        if let brandNameOut = CalorieHitsOnSearch[calorieKeys.brandName] as? String {
            brandName = brandNameOut
        } else { brandName = nil}
        
        if let nfCaloriesOut = CalorieHitsOnSearch[calorieKeys.nfCalories] as? Double {
            nfCalories = nfCaloriesOut
        } else {nfCalories = nil}
        
        if let servingSizeOut = CalorieHitsOnSearch[calorieKeys.servingSize] as? Int {
            servingSize = servingSizeOut
        } else {servingSize = nil}
        
        if let servingUnitOut = CalorieHitsOnSearch[calorieKeys.servingUnit] as? String {
            servingUnit = servingUnitOut
        } else {servingUnit = nil}
        
    }
    
    
}


/*
 item_id: "592925df9e0aa2e1332e1d60",
 item_name: "Chicken Pizza",
 brand_name: "Lunchables",
 nf_calories: 220,
 nf_serving_size_qty: 1,
 nf_serving_size_unit: "serving"
 
 */

