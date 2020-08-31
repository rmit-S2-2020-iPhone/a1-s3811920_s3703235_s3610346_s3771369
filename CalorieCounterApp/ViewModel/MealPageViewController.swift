//
//  MealPageViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import UIKit

class MealPageViewController: UIViewController {

    
    @IBOutlet weak var mealName: UILabel!
    
    var meal: MealViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        mealName.text = meal?.mealName
    }
    
}
