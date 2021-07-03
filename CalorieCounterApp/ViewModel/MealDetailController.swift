//
//  MealDetailController.swift
//  CalorieCounterApp
//
//  Created by Joshua Baruwa on 11/10/2020.
//

import UIKit

class MealDetailController: UIViewController {

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var serving: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet var carbo: UILabel!
    @IBOutlet var protien: UILabel!
    @IBOutlet var fat: UILabel!
    @IBOutlet var vitaa: UILabel!
    @IBOutlet var vitac: UILabel!
    @IBOutlet var iron: UILabel!
    
    
    
    var mealPageVM = MealPageVM()
    var meal:MealDetailFields?
    var type = ""
    var type_id = 0
    var caloriesn = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        mealName.text = meal?.item_name
        serving.text = String.init(describing: meal!.nf_serving_size_qty!)
        carbo.text = String.init(describing: meal!.nf_total_carbohydrate!)
        protien.text = String.init(describing: meal!.nf_protein!)
        fat.text = String.init(describing: meal!.nf_total_fat!)
        if(meal?.nf_vitamin_a_dv != nil){
            vitaa.text = String.init(describing: meal!.nf_vitamin_a_dv!)
        }else{
            vitaa.text = "0"
        }
        if(meal?.nf_vitamin_c_dv != nil){
            vitac.text = String.init(describing: meal!.nf_vitamin_c_dv!)
        }else{
            vitac.text = "0"
        }
        if(meal?.nf_iron_dv != nil){
            iron.text = String.init(describing: meal!.nf_iron_dv!)
        }else{
            iron.text = "0"
        }
        self.caloriesn = meal!.nf_calories!
        calories.text = String.init(describing: self.caloriesn)+" KJ" 
        // Do any additional setup after loading the view.
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
        mealPageVM.addNutritionDetail(type: self.type, type_id: Int64(type_id), name: mealName.text!, serving: serving.text!, qty:Int64(0), cal: Int64(caloriesn))
       }
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
        mealPageVM.checkMeal(name: (self.meal?.item_name)!)
        return stat
    }
    func showAlertView(title:String,Message:String){
           let alert = UIAlertController(title: title, message: Message, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
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
