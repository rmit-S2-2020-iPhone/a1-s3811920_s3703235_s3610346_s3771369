//
//  NutritionixAPI.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NutritionixAPI  {
    static func getNutritionDetils(query:String,success: @escaping (MealDetailBase?,Error?) -> ()) {
        var params = "?"
        params += "results=0:20&"
        params += "fields=item_name,brand_name,item_id,nf_calories,nf_total_carbohydrate,nf_protein,nf_total_fat,nf_vitamin_a_dv,nf_vitamin_c_dv,nf_iron_dv&"
        params += "appId=da6ded5d&"
        params += "appKey=ba4444d5ebe219f0a185ad113e80c954"
        
        guard let url = URL(string: "https://api.nutritionix.com/v1_1/search/"+query+params) else {
          return
        }

        Alamofire.request(url, method: .get, encoding: URLEncoding.default)
          .validate()
          .responseObject{ (response: DataResponse<MealDetailBase>) in
              
              switch response.result {
              case .success:
                  print("Nutrition Details Validation Successful")
                  let responseVal = response.result.value!
                  success(responseVal,nil)
              case .failure(let error):
                  print(error)
                  success(nil,error)
              }
        }
        }
}
