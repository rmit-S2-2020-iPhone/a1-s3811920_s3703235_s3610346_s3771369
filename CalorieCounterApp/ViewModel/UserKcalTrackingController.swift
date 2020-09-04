//
//  UserKcalTrackingController.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 27/8/20.
//

import UIKit

class UserKcalTrackingController: UIViewController {

    @IBOutlet var total_kcal_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        total_kcal_lbl.text = String(getCalories())+" KJ"
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
