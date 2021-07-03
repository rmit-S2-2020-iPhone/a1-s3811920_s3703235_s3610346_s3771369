//
//  Users.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 2/10/20.
//

import Foundation

class UsersModel{
    var id : Int64?
    var name : String?
    var dob : String?
    var height : Int64?
    var weight : Int64?
    var goal : String?
    var active: String?
    var gender: String?
    var image: Data?
      
    init(){
        
    }
    init(id:Int64,name:String,dob:String,height:Int64,weight:Int64,goal:String,active:String,gender:String,image:Data){
      
        self.id = id
        self.name = name
        self.dob = dob
        self.height = height
        self.weight  = weight
        self.goal = goal
        self.active = active
        self.gender = gender
        self.image = image
    }
}
