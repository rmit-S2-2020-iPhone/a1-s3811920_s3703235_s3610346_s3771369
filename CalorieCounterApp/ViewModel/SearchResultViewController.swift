//
//  SearchResultViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation
import UIKit


class SearchResultViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    //private var mealsListViewModel: MealsListViewModel!
    private var mealData = [MealsModel]()
    
    var mealVM = SearchResultViewModel()
    var type = ""
    var mealname = ""
    var mealid = 0
    // searchBar filter
    //private var filterMealsListViewModel: MealsListViewModel!
    //private var filterMealData: MockData!
    
    //private lazy var nutritionixAPI = NutritionixAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMeal(mealName: "Hamburger")

        searchBar.delegate = self
        getMealsByType(type: type)
        //self.mealsListViewModel = MealsListViewModel(mealData: self.mealData)
        
        // searchBar filter
        //self.filterMealData = MockData()
        //self.filterMealsListViewModel = MealsListViewModel(mealData: self.filterMealData)
        
        self.tableView.reloadData()
    }
    
    @IBAction func AddMealEvent(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add New Meal", message: "", preferredStyle: UIAlertController.Style.alert)
       
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            self.addMeal(type: self.type, name: firstTextField.text!)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Meal Name"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addMeal(type:String,name:String){
        mealVM.mealCompletionHandler { [weak self] (status,message) in
            
            guard let self = self else {return}
            
            if(status){
                self.showAlertView(title: "Alert", Message: message)
                self.getMealsByType(type: self.type)
            }else{
                self.showAlertView(title: "Alert", Message: message)
            }
        
        }
        mealVM.addMeal(mealtype: type, mealname: name)
    }
    
    func getMealsByType(type:String){
        mealVM.mealsTypeCompletionHandler{ [weak self] (meals) in
            guard let self = self else {return}
            self.mealData = meals
        }
        mealVM.getMealsByType(type: type)
        self.tableView.reloadData()
    }
    
    func seachMeal(query:String){
        mealVM.mealsTypeCompletionHandler{ [weak self] (meals) in
            guard let self = self else {return}
            self.mealData = meals
        }
        mealVM.searchMeal(query: query)
    }
    
    func showAlertView(title:String,Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let mealPageVC = segue.destination as! MealPageViewController
            mealPageVC.mealname = self.mealname
            mealPageVC.mealid = self.mealid
        }
    }
    
    // returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.filterMealsListViewModel.filterViewModel.count
        return self.mealData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mealViewModel = self.mealData[indexPath.row]
        cell.textLabel?.text = "\(mealViewModel.mealtype!)-\(mealViewModel.mealname!)"

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let mealViewModel = self.filterMealsListViewModel.filterViewModel[indexPath.row]
        self.mealname = self.mealData[indexPath.row].mealname!
        self.mealid = Int(self.mealData[indexPath.row].id!)
        performSegue(withIdentifier: "MasterToDetail", sender: self)
    }
    
    
    // search bar filter
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
             getMealsByType(type: type)
        } else {
             seachMeal(query: searchText)
        }
        self.tableView.reloadData()
    }
    
    
    func getMeal(mealName: String?) {
//        nutritionixAPI.nutritionInfo(foodName: mealName!) { [weak self] (meals, error) in
//            if let error = error {
//                print("Error forwarding meals (\(error)")
//            }
//        }
        
        //let newMeal = NewMealViewViewModel()
        //newMeal.getMeal(meal: "Salad")
        
        //var nutritionix = NutritionixAPI()
        //nutritionix.makeRequest(searchString: "Salad")
        
    }

}
