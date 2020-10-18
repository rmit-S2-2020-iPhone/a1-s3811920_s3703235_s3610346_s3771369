
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 2/10/20.
//


import Foundation
import ObjectMapper

struct MealDetailFields : Mappable {
	var item_id : String?
    var item_name : String?
    var brand_name : String?
    var nf_calories : Int?
    var nf_total_fat : Int?
    var nf_total_carbohydrate : Int?
    var nf_protein : Int?
    var nf_vitamin_a_dv : Int?
    var nf_vitamin_c_dv : Int?
    var nf_iron_dv : Int?
    var nf_serving_size_qty : Int?
    var nf_serving_size_unit : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

        item_id <- map["item_id"]
        item_name <- map["item_name"]
        brand_name <- map["brand_name"]
        nf_calories <- map["nf_calories"]
        nf_total_fat <- map["nf_total_fat"]
        nf_total_carbohydrate <- map["nf_total_carbohydrate"]
        nf_protein <- map["nf_protein"]
        nf_vitamin_a_dv <- map["nf_vitamin_a_dv"]
        nf_vitamin_c_dv <- map["nf_vitamin_c_dv"]
        nf_iron_dv <- map["nf_iron_dv"]
        nf_serving_size_qty <- map["nf_serving_size_qty"]
        nf_serving_size_unit <- map["nf_serving_size_unit"]
	}

}
