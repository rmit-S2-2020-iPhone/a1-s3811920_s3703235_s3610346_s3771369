//
//  personalData.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 25/8/20.
//

import Foundation

enum gender {
    case Male , Female
}
enum goal :String{
    case loseWeight = "Loss Weight", gainWeight = "Gain Weight", maintainWeight = "Maintain Weight"
}

enum activityLevel:String {
    case sedentary = "Sedentary", lightlyActive = "lightly Active", active = "Active", veryActive = "Very Active"
}

struct personalInfoSet {
   
    private var name: String
    private var currentWeight:Double
    private var currentHeight:Double
    
    init(name:String, currentWeight:Double, currentHeight:Double) {
        
        self.name = name
        self.currentHeight = currentHeight
        self.currentWeight = currentWeight
        
        }
    
    var getName: String {
        get {
            return name
        }
    }
    
    
    func calculateBMI() -> Int {
        let bmi = (Int(currentWeight/(currentHeight)) ^ 2) * 703
        return bmi
    }
    
    func getCalories() -> Int {
        
        let bmicount = calculateBMI()
        if bmicount < Int(18.5) {
            return 1
        }
        else if bmicount < Int(24.5) && bmicount >= Int(18.5)  {
            return 2
        }
        else if bmicount < Int(29) && bmicount >= Int(24.5) {
            return 3
        }
        else if bmicount >= Int(29) {
            return 4
        }
        return 0
        
    }
    
    func printCalorie() -> String{
    
        if getCalories() == 1 {
            return "Nice"
        }
        else {
           return "Bad"
        }
}

struct CustomDate{
    // Marked as optional as invalid construction data will produce a nil value
    private var date:Date?
    
    init(day:Int, month:Int, year:Int, timeZone:TimeZone = .current){
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.timeZone = timeZone
    
        
        let userCalendar = Calendar.current
        // Swift API here can return an Optional Value
        date = userCalendar.date(from: dateComponents)
    }
    
    // Default value if the user does not provide a format
    func formatted(as format: String = "dd-MM-yyyy") -> String?
    {
        // Early termination if date has not been initialised
        guard let date = self.date else {return nil}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }

}


}
