//
//  MealsCoreService.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation
import UIKit
import CoreData

class MealsCoreService{
    

    var txtId=""
    var txtMealtype=""
    var txtMealname=""
   
    
    static func createMeal(id:Int64,mealtype:String,mealname:String)->Bool{
        
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return false
       }
       let managedContext  = appDelegate.persistentContainer.viewContext
       
       let mealEntity = NSEntityDescription.entity(forEntityName: "Meals", in: managedContext)
       
       let meal = NSManagedObject(entity: mealEntity!, insertInto: managedContext)

        meal.setValue(id, forKey: "id")
        meal.setValue(mealtype, forKey: "mealtype")
        meal.setValue(mealname, forKey: "mealname")
        
       do {
           
           try managedContext.save()
           return true
       }catch let error as NSError{
           print("Could not save. \(error), \(error.userInfo)")
           return false
       }
    }
       
    static func searchMeal(text:String) -> [MealsModel]{
           var mealM = [MealsModel]()
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return mealM
           }
           let managedContext = appDelegate.persistentContainer.viewContext
           
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meals")
            fetchRequest.returnsObjectsAsFaults = false
            let predicateMealName = NSPredicate(format: "mealname CONTAINS[cd] %@", text)

            let andPredicate = NSCompoundPredicate(type: .or, subpredicates: [predicateMealName])
            fetchRequest.predicate = andPredicate
        
           do{
               let result = try managedContext.fetch(fetchRequest)
               print(result)
               for data in result as! [NSManagedObject]{
                var id = data.value(forKey: "id") as? Int64
                var mealtype = data.value(forKey: "mealtype") as? String
                var mealname = data.value(forKey: "mealname") as? String
                
                if(id == nil){
                    id = 0
                }
                if(mealtype == nil){
                    mealtype = ""
                }
                if(mealname == nil){
                    mealname = ""
                }
                let meal = MealsModel.init(id: id!, mealtype: mealtype!, mealname: mealname!)
                mealM.append(meal)
               }
             
           }catch {
               print("failed")
           }
           return mealM
       }
    
       static func incrementID() -> Int64{

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meals")

           // Sort Descriptor
        let idDescriptor: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: false)
           fetchRequest.sortDescriptors = [idDescriptor] // Note this is a array, you can put multiple sort conditions if you want

           // Set limit
           fetchRequest.fetchLimit = 1

           var newId = 0; // Default to 0, so that you can check if do catch block went wrong later

           do {
            let results = try managedContext.fetch(fetchRequest)

                if(results.count == 1){
                    newId = Int((results[0] as AnyObject).id + 1)
                }else{
                    newId = 1
                }

           } catch {
               let fetchError = error as NSError
               print(fetchError)
           }
        return Int64(newId)
       }
    
    
    static func DeleteMeal(id:Int64) -> Bool{

       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return false
       }

       let managedContext = appDelegate.persistentContainer.viewContext

       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meals")
       fetchRequest.predicate = NSPredicate(format: "id =="+String(id))
       do{
           let results = try managedContext.fetch(fetchRequest)
           for data in results as! [NSManagedObject]{
               let dataObject:NSManagedObject = data
               managedContext.delete(dataObject)
           }
        try managedContext.save()
           return true
       }catch let error as NSError{
            print("Detele all data in error : \(error) \(error.userInfo)")
       }
       return false
   }
    static func retrieveAllMeals() -> [MealsModel]{
        var mealM = [MealsModel]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return mealM
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meals")

        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                var id = data.value(forKey: "id") as? Int64
                var mealtype = data.value(forKey: "mealtype") as? String
                var mealname = data.value(forKey: "mealname") as? String

                if(id == nil){
                    id = 0
                }
                if(mealtype == nil){
                    mealtype = ""
                }
                if(mealname == nil){
                    mealname = ""
                }
              
                let meal = MealsModel.init(id: id!, mealtype: mealtype!, mealname: mealname!)
                mealM.append(meal)
            }

        }catch {
            print("failed")
        }
        return mealM
    }
    
    static func retrieveMealsByType(type:String) -> [MealsModel]{
           var mealM = [MealsModel]()
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return mealM
           }
           let managedContext = appDelegate.persistentContainer.viewContext

           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Meals")
           fetchRequest.predicate = NSPredicate(format: "mealtype = %@",type)
           do{
               let result = try managedContext.fetch(fetchRequest)
               for data in result as! [NSManagedObject]{
                   var id = data.value(forKey: "id") as? Int64
                   var mealtype = data.value(forKey: "mealtype") as? String
                   var mealname = data.value(forKey: "mealname") as? String

                   if(id == nil){
                       id = 0
                   }
                   if(mealtype == nil){
                       mealtype = ""
                   }
                   if(mealname == nil){
                       mealname = ""
                   }
                 
                   let meal = MealsModel.init(id: id!, mealtype: mealtype!, mealname: mealname!)
                   mealM.append(meal)
               }

           }catch {
               print("failed")
           }
           return mealM
       }
    
}

