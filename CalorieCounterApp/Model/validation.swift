//
//  validation.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 24/9/20.
//

import Foundation


class Validation {
    
    public func validateName(name: String) ->Bool {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        let nameRegex = "[A-Za-z]+"
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
        
    }
    
    
    
    
    
    
}
