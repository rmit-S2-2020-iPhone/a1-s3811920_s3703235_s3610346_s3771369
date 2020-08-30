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
    
    // searchBar filter
    private var filterMealsListViewModel: MealsListViewModel!
    private var filterMealData: MockData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.mealData = MockData()
        self.mealsListViewModel = MealsListViewModel(mealData: self.mealData)
        
        // searchBar filter
        self.filterMealData = MockData()
        self.filterMealsListViewModel = MealsListViewModel(mealData: self.filterMealData)
        
        self.tableView.reloadData()
    }
    
    // returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterMealsListViewModel.filterViewModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mealViewModel = self.filterMealsListViewModel.filterViewModel[indexPath.row]
        cell.textLabel?.text = "\(mealViewModel.mealName!)"

        return cell
    }
    
    
    // search bar filter
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterMealsListViewModel.filterViewModel = []
        for meal in mealsListViewModel.mealViewModel {
            if meal.mealName.lowercased().contains(searchText.lowercased()){
                filterMealsListViewModel.addFilteredMeals(meal)
            }
        }
        self.tableView.reloadData()
    }
    
}
