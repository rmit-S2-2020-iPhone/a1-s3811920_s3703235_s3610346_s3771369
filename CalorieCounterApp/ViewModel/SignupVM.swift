//
//  SignupVM.swift
//  CalorieCounterApp
//
//  Created by Joshua Baruwa on 10/10/2020.
//

import Foundation

class SignupVM: NSObject{
    typealias requestCallBack = (_ status:Bool,_ messaage:String) ->Void
    typealias getUserCallBack = (_ users:[UsersModel]) -> Void
    
    var usersCallBack:getUserCallBack?
    var responseCallBack:requestCallBack?
    
    func addUser(name:String,dob:String,height:Int64,weight:Int64,gender:String,goal:String,active:String){
       let id = UsersCoreService.incrementID()
        if(UsersCoreService.createUser(id: id, name: name, dob: dob, height: height, weight: weight, goal: goal, active: active, gender: gender)){
           self.responseCallBack?(true,"User Successfully Added")
       }else{
           self.responseCallBack?(false,"Something went wrong")
       }
    }
    func deleteAllUsers(){
        UsersCoreService.DeleteAllUsers()
    }
    func updateUser(id:Int64,data:Data){
        if(UsersCoreService.updateUser(id: id, data: data)){
            self.responseCallBack?(true,"Image Update Successfully")
        }else{
            self.responseCallBack?(false,"Something went wrong")
        }
    }
    
    func getUser(){
        let user = UsersCoreService.retrieveUsers()
        self.usersCallBack?(user)
    }
    
    func requestCompletionHandler(callback:@escaping requestCallBack){
        self.responseCallBack = callback
    }
    func usersCompletionHandler(callback:@escaping getUserCallBack){
        self.usersCallBack = callback
    }
}
