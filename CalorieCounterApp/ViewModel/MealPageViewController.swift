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
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = addButton
        setUI()
    }
    
    @objc func add(){
        func alert(message: String) -> Void {
         let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
         present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
          self.dismiss(animated: true)
         }
        }
        
        alert(message: "Calories Added")
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
