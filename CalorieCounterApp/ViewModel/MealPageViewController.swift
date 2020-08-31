//
//  MealPageViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import UIKit

class MealPageViewController: UIViewController {
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var carb: UILabel!
    @IBOutlet weak var pro: UILabel!
    @IBOutlet weak var fats: UILabel!
    @IBOutlet weak var vitA: UILabel!
    @IBOutlet weak var vitC: UILabel!
    @IBOutlet weak var irons: UILabel!
    @IBOutlet weak var serving: UILabel!
    @IBOutlet weak var calories: UILabel!
    var meal: MealViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        mealName.text = meal?.mealName
        serving.text = meal?.serving
        calories.text = meal?.calories
        carb.text = meal?.carbohydrate
        pro.text = meal?.protein
        fats.text = meal?.fat
        vitA.text = meal?.vitaminA
        vitC.text = meal?.vitamicC
        irons.text = meal?.iron
    }
    
}
