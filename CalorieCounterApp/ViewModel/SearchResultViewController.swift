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
    

    private var mealsListViewModel: MealsListViewModel!
    private var mealData: MockData!
    
    // searchBar filter MODEL
    private var filterMealsListViewModel: MealsListViewModel!
    private var filterMealData: MockData!
    
    
    // searchBar filter
//    private var meals = [Meal]()
//    private var mealNames = [String]()
//    private var filter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.mealData = MockData()
        self.mealsListViewModel = MealsListViewModel(mealData: self.mealData)
        
        self.filterMealData = MockData()
        self.filterMealsListViewModel = MealsListViewModel(mealData: self.filterMealData)
        
        // searchBar filter
//        self.meals = mealData.getAllMeals()
//        mealNames = meals.map { $0.name }
        //filter = mealNames
        
        self.tableView.reloadData()
    }
    
    // returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return self.mealsListViewModel.mealViewModel.count
        return self.filterMealsListViewModel.filterViewModel.count
        //return filter.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        let mealViewModel = self.mealsListViewModel.mealViewModel[indexPath.row]
//        cell.textLabel?.text = "\(mealViewModel.mealName!)"
        
        
        let mealViewModel = self.filterMealsListViewModel.filterViewModel[indexPath.row]
        cell.textLabel?.text = "\(mealViewModel.mealName!)"
        
        
        //cell.textLabel?.text = filter[indexPath.row]
        return cell
    }
    
    
    // search bar filter
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filter = []
//        if searchText == "" {
//            //filter = mealNames
//            filter = []
//        } else {
//            for name in mealNames {
//                if name.lowercased().contains(searchText.lowercased()){
//                    filter.append(name)
//                }
//            }
//        }
            
        
        filterMealsListViewModel.filterViewModel = []
        for meal in mealsListViewModel.mealViewModel {
            if meal.mealName.lowercased().contains(searchText.lowercased()){
                filterMealsListViewModel.addFilteredMeals(meal)
            }
        }
        self.tableView.reloadData()
    }
    
}
