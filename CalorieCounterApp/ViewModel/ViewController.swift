//
//  ViewController.swift
//  CalorieCounterApp
//

import UIKit

class ViewController: UIViewController {
    
    //inputfields
    @IBOutlet var name_txt: UITextField!
//    @IBOutlet var dob_txt: UITextField!
    @IBOutlet var current_weight: UITextField!
    @IBOutlet var current_height: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //info screen buttons
    @IBOutlet var male_btn: UIButton!
    @IBOutlet var female_btn: UIButton!
    
    //Goal Screen buttons
    @IBOutlet var lose_weight_btn: UIButton!
    @IBOutlet var matain_weight_btn: UIButton!
    @IBOutlet var gain_weight_btn: UIButton!
    
    //activity screen buttons
    @IBOutlet var secondary_btn: UIButton!
    @IBOutlet var lightly_active: UIButton!
    @IBOutlet var active_btn: UIButton!
    @IBOutlet var very_active_btn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Configure the date Picker
    // Min age is set to 16
    let min_age: Date = Calendar.current.date(byAdding: .year, value: -16, to: Date())!;
    
    // Max age is set to 100
    let max_age: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
    
    
    
    @IBAction func male_btn_listner(_ sender: UIButton) {
        let gender = Helpers.readPreference(key: "gender", defualt: "")
        if(gender == "" || gender == "female"){
            Helpers.writePreference(key: "gender", data: "male")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            female_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
        sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
        
    }
    @IBAction func female_btn_listener(_ sender: UIButton) {
        let gender = Helpers.readPreference(key: "gender", defualt: "")
        if(gender == "" || gender == "male"){
            Helpers.writePreference(key: "gender", data: "female")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            male_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    
//
    
//
//    func validate() {
//        let isValidateName = self.validation.validateName(name: name_txt.text ?? "Name")
//        if (isValidateName == false){
//            print("Incorrect Name")
//            return
//        }
//    }
    
    //Setting up the validation process
    
    
    var validation = Validation()
    
    
    func Inputvalidation() {
        let isValidateName = self.validation.validateName(name: name_txt.text ?? "")
        if (isValidateName == false) {
            Helpers.showAlertView(vc: self, msg: "Name must contain letters")
            return
        }
    }
    
//
    
    func setUserInfo(){
        
        if(name_txt.text == ""){
            Helpers.showAlertView(vc: self, msg: "Please enter your name.")
            return
        }
        
//        if(dob_txt.text == "" ){
//            Helpers.showAlertView(vc: self, msg: "Please enter your date of birth.")
//            return
//        }
        if(current_weight.text == ""){
            Helpers.showAlertView(vc: self, msg: "Please enter your current weight.")
            return
        }
        if(current_height.text == ""){
            Helpers.showAlertView(vc: self, msg: "Please enter your current height.")
            return
        }
        let gender = Helpers.readPreference(key: "gender", defualt: "")
        
        if(gender == ""){
            Helpers.showAlertView(vc: self, msg: "Please select your gender.")
            return
        }
        
//        let goal = Helpers.readPreference(key: "goal", defualt: "")
//        if (goal == "") {
//            Helpers.showAlertView(vc: self, msg: "Please choose your goal.")
//        }
        
        //Sets userDefualts
        Helpers.writePreference(key: "name", data: name_txt.text!)
        //Helpers.writePreference(key: "dob", data: dob_txt.text!)
        Helpers.writePreference(key: "weight", data: current_weight.text!)
        Helpers.writePreference(key: "height", data: current_height.text!)
        
        //for move to next screen
        self.performSegue(withIdentifier: "goal", sender: self)
    }
    
    
    @IBAction func lose_weight_listener(_ sender: UIButton) {
        let goal = Helpers.readPreference(key: "goal", defualt: "")
        if(goal == "" || goal == "lose" || goal == "maintain" || goal == "gain"){
            Helpers.writePreference(key: "goal", data: "lose")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour));         matain_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            gain_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    @IBAction func main_weight_listener(_ sender: UIButton) {
        let goal = Helpers.readPreference(key: "goal", defualt: "")
        if(goal == "" || goal == "lose" || goal == "maintain" || goal == "gain"){
            Helpers.writePreference(key: "goal", data: "maintain")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour));         lose_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            gain_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    @IBAction func gain_weight_listener(_ sender: UIButton) {
        let goal = Helpers.readPreference(key: "goal", defualt: "")
        if(goal == "" || goal == "lose" || goal == "maintain" || goal == "gain"){
            Helpers.writePreference(key: "goal", data: "gain")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            lose_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            matain_weight_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    @IBAction func secondary_btn_listener(_ sender: UIButton) {
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == "" || activity == "secondary" || activity == "lightlyactive" || activity == "active" || activity == "veryactive"){
            Helpers.writePreference(key: "activity", data: "secondary")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            lightly_active.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            very_active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    @IBAction func lightactive_btn_listener(_ sender: UIButton) {
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == "" || activity == "secondary" || activity == "lightlyactive" || activity == "active" || activity == "veryactive"){
            Helpers.writePreference(key: "activity", data: "lightlyactive")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            secondary_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            very_active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    @IBAction func active_btn_listener(_ sender: UIButton) {
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == "" || activity == "secondary" || activity == "lightlyactive" || activity == "active" || activity == "veryactive"){
            Helpers.writePreference(key: "activity", data: "active")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            secondary_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            lightly_active.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            very_active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    @IBAction func very_active_btn(_ sender: UIButton) {
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == "" || activity == "secondary" || activity == "lightlyactive" || activity == "active" || activity == "veryactive"){
            Helpers.writePreference(key: "activity", data: "veryactive")
            sender.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.touchedColour))
            secondary_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            lightly_active.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
            active_btn.backgroundColor = Helpers.UIColorFromHex(rgbValue: UInt32(Helpers.appcolor))
        }
    }
    
    //button listener
    @IBAction func next_btn_listener(_ sender: UIButton) {
        Inputvalidation()
        setUserInfo()
        
        
    }
    
    @IBAction func goal_next_btn_listener(_ sender: UIButton) {
       // let goal = Helpers.readPreference(key: "goal", defualt: "")
        //        if (goal == "") {
        //            Helpers.showAlertView(vc: self, msg: "Please choose your goal.")
        //        }
        
        
        
        let goal = Helpers.readPreference(key: "goal", defualt: "")
        if(goal == ""){
            Helpers.showAlertView(vc: self, msg: "Please select your goal.")
            return
        }
        self.performSegue(withIdentifier: "activity", sender: self)
    }
    @IBAction func finish_listener(_ sender: UIButton) {
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == ""){
            Helpers.showAlertView(vc: self, msg: "Please select your activity.")
            return
        }
        self.performSegue(withIdentifier: "finish", sender: self)
        
    }
    
}
