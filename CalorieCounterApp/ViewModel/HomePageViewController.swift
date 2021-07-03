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
    var mealtype = ""
    var typeid = 0
    var homeVM = HomePageVM()
    var calSum = 0
    func configureButtons(){
        for button in options {
            button.layer.cornerRadius = 16.8
        }
    }
    
    
    
    func getSumCalories(){
        homeVM.sumCalCompletionHandler { [weak self] (sum) in
           guard let self = self else {return}
            self.calSum = Int(sum)
        }
        homeVM.getSumCalories()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getSumCalories()
        var new = getCalories() - calSum
        if(new < 0){
            new = 0
        }
        calorieLbl.text = String(new)+" KJ"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    
        print(self.calSum)
        
        
    }
    
    @IBAction func breakfast_event(_ sender: UIButton) {
        self.mealtype = "Breakfast"
        self.typeid = 0
        self.performSegue(withIdentifier: "meal", sender: self)
    }
    @IBAction func lunch_event(_ sender: UIButton) {
        self.mealtype = "Lunch"
        self.typeid = 1
        self.performSegue(withIdentifier: "meal", sender: self)
    }
    @IBAction func dinner_event(_ sender: UIButton) {
        self.mealtype = "Dinner"
        self.typeid = 2
        self.performSegue(withIdentifier: "meal", sender: self)
    }
    @IBAction func snak_event(_ sender: UIButton) {
        self.mealtype = "Snak"
        self.typeid = 3
        self.performSegue(withIdentifier: "meal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "meal" {
            let mealPageVC = segue.destination as! SearchController
            mealPageVC.type = mealtype
            mealPageVC.typeid = self.typeid 
        }
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
