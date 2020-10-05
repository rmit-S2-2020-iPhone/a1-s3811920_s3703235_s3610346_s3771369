//
//  NutritionixAPI.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation
import Alamofire

enum DataManagerError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

class NutritionixAPI : NSObject {
    var ID = ""
    typealias NutritionCompletionHandler = ([Mealx]?, DataManagerError?) -> ()
    
    func nutritionInfo(foodName: String, completion: @escaping NutritionCompletionHandler) {
        
        let url = "https://api.nutritionix.com/v1_1/search/\(foodName)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=\(API.APPLICATION_ID)&appKey=\(API.APPLICATION_KEY)"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            self.didFetchFoodData(response: response, completion: completion)
            print(response)
        }
    }
    
    
    private func didFetchFoodData(response: DataResponse<Any>, completion: NutritionCompletionHandler) {
        
        switch response.result {
        case .success:
            
            if response.response?.statusCode == 200 {
                
                let result_dict = response.result.value as! NSDictionary
                let result_array = result_dict["hits"] as! NSArray
                
                let meals = mapToMealArray(jsonDictionaries: result_array)
                completion(meals, nil)
            }
            else {
                completion(nil, .failedRequest)
            }
            
            break
        case .failure:
            completion(nil, .failedRequest)
            break
        }
    }
    
    private func mapToMealArray(jsonDictionaries: NSArray) -> [Mealx] {
        
        let mutableArray = NSMutableArray()
        
        for object in jsonDictionaries {
            
            if let dict = object as? NSDictionary {
                guard let fields = dict["fields"] as? NSDictionary else { return [] }
                guard let id = fields["item_id"] as? String else { return [] }
                guard let name = fields["item_name"] as? String else { return [] }
                guard let calories = fields["nf_calories"] as? Float else { return [] }
                guard let fat = fields["nf_total_fat"] as? Float else { return [] }
                
                mutableArray.add(Mealx(id: id, name: name, calories: calories, fat: fat))
            }
        }
        
        guard let mealArray = mutableArray as? [Mealx] else { return [] }
        ID = mealArray[0].id
        
        return mealArray
    }
    
    
    func makeRequest(searchString: String) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.nutritionix.com/v1_1/search/")! as URL)
        _ = URLSession.shared
        request.httpMethod = "POST"
        
        let params = [
            "appId" : API.APPLICATION_ID,
            "appKey" : API.APPLICATION_KEY,
            "fields" : ["item_name", "brand_name", "keywords", "usda_fields"],
            "limit" : 50,
            "query" : searchString,
            "filters" : ["exists" : ["usda_fields": true]]
            ] as [String : Any]
        
        
        let urlString = "https://api.nutritionix.com/v1_1/search/"
        
        Alamofire.request(URL.init(string: urlString)!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(response.result)
            
            switch response.result {
                
            case .success(_):
                if response.value != nil
                {
                    print("successsful response")
                    print(response)
                }
                break
            case .failure( _):
                print("unsuccesssful response")
                break
            }
        }
    }
}
