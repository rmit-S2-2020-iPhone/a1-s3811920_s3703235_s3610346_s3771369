//
//  SearchController.swift
//  CalorieCounterApp
//
// Created by Timal Pathirana on 27/8/20.
//

import UIKit

class SearchController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
 
    

    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var search_tableview: UITableView!
    var nutritionD = [MealDetailHits]()
    var searchVM = SearchVM()
    var field:MealDetailFields?
    var type = ""
    var typeid = 0
    var isFirst = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        search_tableview.delegate = self
        search_tableview.dataSource = self
        self.getNutitionDetail(query: type)

        // Do any additional setup after loading the view.
    }
    
    func getNutitionDetail(query:String){
        searchVM.requestCompletionHandler { [weak self] (status,message) in
            
            guard let self = self else {return}
            
            if(status){
                Helpers.dismissHUD(view: self.view, isAnimated: true)
                self.showAlertView(title: "Alert", Message: message)
            }else{
                Helpers.dismissHUD(view: self.view, isAnimated: true)
                self.showAlertView(title: "Alert", Message: message)
            }
        
        }
        searchVM.nutritionCompletionHandler { [weak self] (nutritions) in
            guard let self = self else {return}
            if(self.searchbar.text == "" && self.isFirst == true){
                Helpers.dismissHUD(view: self.view, isAnimated: true)
                return
            }
            self.nutritionD.removeAll()
            for (index,row) in nutritions.enumerated(){
                if(row.fields?.item_name != query){
                    self.nutritionD.append(nutritions[index])
                }
            }
            Helpers.dismissHUD(view: self.view, isAnimated: true)
            self.search_tableview.reloadData()
            
        }
        Helpers.showHUD(view: self.view, progressLabel: "Loading...")
        let str = query.replacingOccurrences(of: " ", with: "")
        searchVM.getNutritionDetail(query: str)
    }
    
    func showAlertView(title:String,Message:String){
       let alert = UIAlertController(title: title, message: Message, preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nutritionD.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
        cell.meal_name.text = self.type+"-"+(self.nutritionD[indexPath.row].fields?.item_name!)!
        let str = "Type: "+(self.nutritionD[indexPath.row].fields!.nf_serving_size_unit!)+", Quantity: "+(String.init(describing: self.nutritionD[indexPath.row].fields!.nf_serving_size_qty!));
        cell.meal_detail_lbl.text = str+",Calories: "+(String.init(describing: self.nutritionD[indexPath.row].fields!.nf_calories!))
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.field = self.nutritionD[indexPath.row].fields
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
    // search bar filter
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchText == ""{
            self.nutritionD.removeAll()
            self.search_tableview.reloadData()
            isFirst = false
       } else {
            isFirst = true
            self.getNutitionDetail(query: searchText)
       }
       
    }
    
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "detail" {
            let mealPageVC = segue.destination as! MealDetailController
            mealPageVC.meal = self.field
            mealPageVC.type = self.type
            mealPageVC.type_id = self.typeid
        }
        
    }
   

}
