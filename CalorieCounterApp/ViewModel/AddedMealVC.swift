//
//  AddedMealVC.swift
//  CalorieCounterApp
//
// Created by Timal Pathirana on 27/8/20.
//

import UIKit

class AddedMealVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var meal_tableview: UITableView!
    var addedmeal_array = [MealDetailsModel]()
    var addedVM = AddedMealVM()
    
    override func viewWillAppear(_ animated: Bool) {
        getAllMealsDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meal_tableview.delegate = self
        meal_tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    func getAllMealsDetails(){
        addedVM.mealDetailsCompletionHandler{ [weak self] (meals) in
            guard let self = self else {return}
            self.addedmeal_array = meals
        }
        addedVM.getMealsDetails()
        self.meal_tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedmeal_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedMealCell") as! AddedMealCell
        
        cell.meal_name.text = self.addedmeal_array[indexPath.row].type!+"-"+self.addedmeal_array[indexPath.row].name!
        let str = "Type: "+self.addedmeal_array[indexPath.row].serving!+", Quantity: "+String.init(describing: self.addedmeal_array[indexPath.row].qty!);
        cell.meal_detail_lbl.text = str+",Calories: "+String.init(describing: self.addedmeal_array[indexPath.row].calories!)
        
        return cell
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
