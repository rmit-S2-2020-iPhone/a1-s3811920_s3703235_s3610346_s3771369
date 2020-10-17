import Foundation
import ObjectMapper

struct MealDetailBase : Mappable {
	var total_hits : Int?
	var max_score : Double?
	var hits : [MealDetailHits]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		total_hits <- map["total_hits"]
		max_score <- map["max_score"]
		hits <- map["hits"]
	}

}
