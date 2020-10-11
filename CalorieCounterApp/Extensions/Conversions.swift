//
//  Conversions.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

extension String {
    
    func toFloat() -> Float {
        guard let floatValue = Float(self) else { return 0 }
        return floatValue
    }
    
}
