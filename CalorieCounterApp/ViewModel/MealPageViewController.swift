//
//  MealPageViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import UIKit

class MealPageViewController: UIViewController {
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var serving: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var calories: UILabel!
   //var meal: MealViewModel?
    var mealname = ""
    var mealid = 0
    var caloriesn = 0
    var mealPageVM = MealPageVM()
    var nutritionD : MealDetailFields?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setUI()
        getNutitionDetail()
    }
    func checkMeal()->Bool{
        var stat = false
        mealPageVM.requestCompletionHandler { [weak self] (status,message) in
             guard let self = self else {return}
             
             if(status){
                 Helpers.dismissHUD(view: self.view, isAnimated: true)
                 self.showAlertView(title: "Alert", Message: message)
                 stat = status
             }else{
                 Helpers.dismissHUD(view: self.view, isAnimated: true)
                 self.showAlertView(title: "Alert", Message: message)
                 stat = status
             }
        }
        //mealPageVM.checkMeal(mealid: Int64(mealid))
        return stat
    }
    @IBAction func add_to_meal_event(_ sender: UIButton) {
        mealPageVM.requestCompletionHandler { [weak self] (status,message) in
           guard let self = self else {return}
           
           if(status){
               Helpers.dismissHUD(view: self.view, isAnimated: true)
               self.showAlertView(title: "Alert", Message: message)
           }else{
               Helpers.dismissHUD(view: self.view, isAnimated: true)
               self.showAlertView(title: "Alert", Message: message)
           }
       
       }
        if(!self.checkMeal()){
           // mealPageVM.addNutritionDetail(mealid: Int64(mealid), name: mealName.text!, serving: serving.text!, qty:Int64( qty.text!)!, cal: Int64(caloriesn))
        }
    }
    func getNutitionDetail(){
        mealPageVM.requestCompletionHandler { [weak self] (status,message) in
            
            guard let self = self else {return}
            
            if(status){
                Helpers.dismissHUD(view: self.view, isAnimated: true)
                self.showAlertView(title: "Alert", Message: message)
            }else{
                Helpers.dismissHUD(view: self.view, isAnimated: true)
                self.showAlertView(title: "Alert", Message: message)
            }
        
        }
        mealPageVM.nutritionCompletionHandler { [weak self] (nutritions) in
            guard let self = self else {return}
            self.nutritionD = nutritions
            Helpers.dismissHUD(view: self.view, isAnimated: true)
            self.setUI()
        }
        Helpers.showHUD(view: self.view, progressLabel: "Loading...")
        let str = mealname.replacingOccurrences(of: " ", with: "")
        
        mealPageVM.getNutritionDetail(query: str)
    }
    func setUI(){
        mealName.text = self.nutritionD!.item_name!
        qty.text = String.init(describing: self.nutritionD!.nf_serving_size_qty!)
        serving.text = self.nutritionD!.nf_serving_size_unit!
        self.caloriesn = self.nutritionD!.nf_calories!
        calories.text = String.init(describing: self.caloriesn)+" KJ"
    }

    func showAlertView(title:String,Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
