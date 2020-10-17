//
//  DMealsCoreService.swift
//  CalorieCounterApp
//
//  Created by Joshua Baruwa on 10/10/2020.
//

import Foundation
import UIKit
import CoreData

class DMealsCoreService{
    
    static func createMealDetail(id:Int64,type_id:Int64,type:String,name:String,serving:String,qty:Int64,cal:Int64)->Bool{
        
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return false
       }
       let managedContext  = appDelegate.persistentContainer.viewContext
       
       let mealEntity = NSEntityDescription.entity(forEntityName: "Mealdetails", in: managedContext)
       
       let meal = NSManagedObject(entity: mealEntity!, insertInto: managedContext)

        meal.setValue(id, forKey: "id")
        meal.setValue(type, forKey: "type")
        meal.setValue(name, forKey: "name")
        meal.setValue(serving, forKey: "serving")
        meal.setValue(qty, forKey: "qty")
        meal.setValue(cal, forKey: "calories")
        meal.setValue(type_id, forKey: "type_sort")

       do {
           try managedContext.save()
           return true
       }catch let error as NSError{
           print("Could not save. \(error), \(error.userInfo)")
           return false
       }
    }
    
    static func incrementID() -> Int64{
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
             return 0
         }
         let managedContext = appDelegate.persistentContainer.viewContext
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mealdetails")

            // Sort Descriptor
         let idDescriptor: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: false)
            fetchRequest.sortDescriptors = [idDescriptor]
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
    static func retrieveAllMeals() -> [MealDetailsModel]{
       var mealM = [MealDetailsModel]()
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return mealM
       }
       let managedContext = appDelegate.persistentContainer.viewContext
       let typeSort = NSSortDescriptor(key:"type_sort", ascending:true)
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mealdetails")
        fetchRequest.sortDescriptors = [typeSort]
       do{
           let result = try managedContext.fetch(fetchRequest)
           for data in result as! [NSManagedObject]{
               var id = data.value(forKey: "id") as? Int64
               var type = data.value(forKey: "type") as? String
               var name = data.value(forKey: "name") as? String
               var serving = data.value(forKey: "serving") as? String
               var qty = data.value(forKey: "qty") as? Int64
               var cal = data.value(forKey: "calories") as? Int64

               if(id == nil){
                   id = 0
               }
               if(type == nil){
                   type = ""
               }
               if(name == nil){
                   name = ""
               }
               if(serving == nil){
                  serving = ""
               }
               if(qty == nil){
                   qty = 0
               }
               if(cal == nil){
                   cal = 0
               }
             
              let meal = MealDetailsModel.init(id: id!, type: type!, name: name!, serving: serving!, qty: qty!, cal: cal!)
              mealM.append(meal)
           }

       }catch {
           print("failed")
       }
       return mealM
   }
    
   static func checkMeal(name : String)->Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format:"name == %@",name)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> ( entityName: "Mealdetails")
        fetchRequest.predicate = predicate
        do{
            let fetchRecult = try managedContext.fetch(fetchRequest)
            if fetchRecult.count>0
            {
               return true
            }
            else
            {
                return false
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return false
    }
    
    static func retrieveSumCalories() -> Int64{
        var mealM : Int64 = 0
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
             return mealM
         }
         let managedContext = appDelegate.persistentContainer.viewContext

         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Mealdetails")

         do{
             let result = try managedContext.fetch(fetchRequest)
             for data in result as! [NSManagedObject]{
                let cal = data.value(forKey: "calories") as? Int64
                 mealM += cal!
             }

         }catch {
             print("failed")
         }
         return mealM
     }
    
}
