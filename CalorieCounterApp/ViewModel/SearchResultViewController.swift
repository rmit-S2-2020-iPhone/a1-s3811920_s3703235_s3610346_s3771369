//
//  SearchResultViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 29/8/20.
//

import Foundation
import UIKit

class SearchResultViewController: UITableViewController {
    
    private var mealsListViewModel: MealsListViewModel!
    private var mealData: MockData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mealData = MockData()
        self.mealsListViewModel = MealsListViewModel(mealData: self.mealData)
        
        self.tableView.reloadData()
    }
    
    // returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealsListViewModel.mealViewModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mealViewModel = self.mealsListViewModel.mealViewModel[indexPath.row]
        cell.textLabel?.text = "\(mealViewModel.mealName!)"
        
        
        return cell
    }
    
}
