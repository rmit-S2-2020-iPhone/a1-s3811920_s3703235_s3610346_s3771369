//
//  HomePageViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import Foundation
import UIKit




class HomePageViewController: UIViewController {
    
    @IBOutlet weak var calorieLbl: UILabel!
    
    
    
    @IBOutlet var options: [UIButton]!
    
    func configureButtons(){
        for button in options {
            button.layer.cornerRadius = 16.8
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        calorieLbl.text = String(getCalories())+" KJ"
        
    }
    
    func calculateBMI() -> Int {
        guard let currentWeight = Double(Helpers.readPreference(key: "weight", defualt: "")) else { return 0 }
        guard let currentHeight = Double(Helpers.readPreference(key: "height", defualt: "")) else {
            return 1
        }
        
        
        // Calculating BMI =
        /*
         
         BMI formula =    Weight (kg)
         ---------------
         [Height( m) ] ^2
         */
        let heightInMeters:Double = currentHeight / 100
        let denominator:Double = heightInMeters * heightInMeters
        
        let bmi = Int(currentWeight / denominator)
        return bmi
    }
    
    func getCalories() -> Int {
        
        let bmicount = calculateBMI()
        if bmicount < Int(18.5) {
            return 2655
        }
        else if bmicount < Int(24.5) && bmicount >= Int(18.5)  {
            return 2973
        }
        else if bmicount < Int(29) && bmicount >= Int(24.5) {
            return 3227
        }
        else if bmicount >= Int(29) {
            return 3609
        }
        return 0
        
    }
}
