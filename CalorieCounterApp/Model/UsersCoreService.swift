//
//  UsersCoreService.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation
import UIKit
import CoreData

class UsersCoreService{
    
    static func createUser(id:Int64,name:String,dob:String,height:Int64,weight:Int64,goal:String,active:String,gender:String)->Bool{
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return false
           }
           let managedContext  = appDelegate.persistentContainer.viewContext
           
           let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)
           
           let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        
           user.setValue(id, forKey: "id")
           user.setValue(name, forKey: "name")
           user.setValue(dob, forKey: "dob")
           user.setValue(height, forKey: "height")
           user.setValue(weight, forKey: "weight")
           user.setValue(goal, forKey: "goal")
           user.setValue(active, forKey: "active")
           user.setValue(gender, forKey: "gender")

           
           do {
               
               try managedContext.save()
               return true
           }catch let error as NSError{
               print("Could not save. \(error), \(error.userInfo)")
               return false
           }
       }
       
       static func retrieveUsers() -> [UsersModel]{
           var userM = [UsersModel]()
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return userM
           }
           let managedContext = appDelegate.persistentContainer.viewContext
           
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
           do{
               let result = try managedContext.fetch(fetchRequest)
               for data in result as! [NSManagedObject]{
                
                let id = data.value(forKey: "id") as? Int64
                let name = data.value(forKey: "name") as? String
                let dob = data.value(forKey: "dob") as? String
                let height = data.value(forKey: "height") as? Int64
                let weight = data.value(forKey: "weight") as? Int64
                let goal = data.value(forKey: "goal") as? String
                let active = data.value(forKey: "active") as? String
                let gender = data.value(forKey: "gender") as? String
                var image = data.value(forKey: "image") as? Data
                if(image == nil){
                    image = UIImage(named: "person_icon")?.pngData()
                }
                let notification = UsersModel.init(id: id!, name: name!, dob: dob!, height: height!, weight: weight!, goal: goal!, active: active!, gender: gender!, image: image!)
                userM.append(notification)
               }
             
           }catch {
               print("failed")
           }
           return userM
       }
    
    static func incrementID() -> Int64{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")

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
    static func updateUser(id:Int64,data : Data)->Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate (format:"id =="+String(id))
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> ( entityName: "Users")
        fetchRequest.predicate = predicate
        do{
            let fetchRecult = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if fetchRecult.count>0
            {
               fetchRecult[0].setValue(data, forKey: "image")
            }
            else
            {
                return false
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        do {
            try managedContext.save()
            return true
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
   static func DeleteAllUsers() -> Bool{
       
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return false
       }
       
       let managedContext = appDelegate.persistentContainer.viewContext
       
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
      
       do{
           let results = try managedContext.fetch(fetchRequest)
           for data in results as! [NSManagedObject]{
               let dataObject:NSManagedObject = data
               managedContext.delete(dataObject)
           }
           return true
       }catch let error as NSError{
         print("Detele all data in error : \(error) \(error.userInfo)")
         return false
       }
       
   }
    
}
