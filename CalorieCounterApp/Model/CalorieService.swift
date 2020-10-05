//
//  CalorieService.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 5/10/20.
//

import Foundation
import Alamofire


class CalorieService
{
//    let calorieAppID: String
//    let calorieAppKey: String
    let foodItemToSearch: String
    let calorieBaseURL: URL?
    //let calorieBackURL: URL?
    
    init(foodItemToSearch: String) {
//        self.calorieAppKey = AppKey
//        self.calorieAppID = AppID
        self.foodItemToSearch = foodItemToSearch
        calorieBaseURL = URL(string: "https://api.nutritionix.com/v1_1/search/\(foodItemToSearch)")
            
            //?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=\(AppID)&appKey=\(AppKey)")
        //calorieBackURL = URL(string: "?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=\(AppID)&appKey=\(AppKey)")
    }
    
    func getSpecificFoodCalories(appKey: String, appID: String) {
        if let calorieURL = URL(string: "\(calorieBaseURL!)?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=\(appID)&appKey=\(appKey)") {
            Alamofire.request(calorieURL).responseJSON { (response) in
                let jsonDictionary = response.result.value as? [String: Any]
                print(jsonDictionary)
            }
        }
    }
    
    
    
    /* https://api.nutritionix.com/v1_1/search/chickenpizza?results=0:20&fields=item_name,brand_name,item_id,nf_calories&appId=da6ded5d&appKey=ba4444d5ebe219f0a185ad113e80c954
     
     */
}
