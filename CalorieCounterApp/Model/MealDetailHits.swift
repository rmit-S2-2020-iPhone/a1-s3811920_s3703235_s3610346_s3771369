
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 2/10/20.
//

import Foundation
import ObjectMapper

struct MealDetailHits : Mappable {
	var _index : String?
	var _type : String?
	var _id : String?
	var _score : Double?
	var fields : MealDetailFields?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		_index <- map["_index"]
		_type <- map["_type"]
		_id <- map["_id"]
		_score <- map["_score"]
		fields <- map["fields"]
	}

}
