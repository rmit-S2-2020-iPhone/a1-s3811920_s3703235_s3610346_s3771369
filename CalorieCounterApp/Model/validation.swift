//
//  validation.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 24/9/20.
//

import Foundation


class Validation {
    
    public func validateName(name: String) ->Bool {
       
        /* This is to validate the name, This will match any letters and also match any 2nd or 3 names without numbers.
         {3,} use to match the first name to be more than 3 characters long and there is no max limit
         */
        let nameRegex = "[A-Za-z]{3,}.*[A-Za-z]{1,}"
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
    
    // Matching numbers only from 0-9 and min value is 2 digit number and max is 3 digit number
    public func validateWeight(weight: String) ->Bool {
        
        let weightRegex = "[0-9]{2,3}"
        let trimmedString = weight.trimmingCharacters(in: .whitespaces)
        let validateWeight = NSPredicate(format: "SELF MATCHES %@", weightRegex)
        let isvalidateWeight = validateWeight.evaluate(with: trimmedString)
        return isvalidateWeight
    }
    
    // Matching numbers only from 0-9 and min value is 2 digit number and max is 3 digit number
    public func validateHeight(height: String) ->Bool {
        
        let heightRegex = "[0-9]{2,3}"
        let trimmedString = height.trimmingCharacters(in: .whitespaces)
        let validateHeight = NSPredicate(format: "SELF MATCHES %@", heightRegex)
        let isvalidateHeight = validateHeight.evaluate(with: trimmedString)
        return isvalidateHeight
    }
    
    // Validating the date picker to get the birthday. Birthday should be between 18-100 to access the app
    public func validateAge(birthDate: Date) -> Bool {
        // Min age is set to 16
        let min_age: Date = Calendar.current.date(byAdding: .year, value: -16, to: Date())!;
        
        // Max age is set to 100
        let max_age: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
        
        // Configure the date Picker
        var isValidDate: Bool = true;
        if birthDate < max_age || birthDate > min_age {
            isValidDate = false;
        }
        return isValidDate
    }
}
