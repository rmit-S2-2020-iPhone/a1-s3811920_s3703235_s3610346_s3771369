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
    
    var signupVM = SignupVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(datePicker != nil){
            datePicker.addTarget(self, action: #selector(datePickerChanged), for: UIControl.Event.valueChanged)
        }
    }
    @objc func datePickerChanged(datePicker:UIDatePicker){
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        let date = formatter.string(from: datePicker.date)
       Helpers.writePreference(key: "dob", data: date)
    }

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
    
    // User registering First page button listener
    @IBAction func next_btn_listener(_ sender: UIButton) {
        
        Inputvalidation()
        setUserInfo()
    }
    
    // User registering Second page button listener
    @IBAction func goal_next_btn_listener(_ sender: UIButton) {
    
        let goal = Helpers.readPreference(key: "goal", defualt: "")
        if(goal == ""){
            Helpers.showAlertView(vc: self, msg: "Please select your goal.")
            return
        }
        self.performSegue(withIdentifier: "activity", sender: self)
    }
    
    // User registering Third page button listener
    @IBAction func finish_listener(_ sender: UIButton) {
        
        let activity = Helpers.readPreference(key: "activity", defualt: "")
        if(activity == ""){
            Helpers.showAlertView(vc: self, msg: "Please select your activity.")
            return
        }
        
        signupVM.requestCompletionHandler { [weak self] (status,message) in
             guard let self = self else {return}
             
             if(status){
                let storyboard = UIStoryboard(name: "userKcalTracking", bundle: nil)
                let tabbar = storyboard.instantiateViewController(withIdentifier: "tabbar") as? UINavigationController
                tabbar?.modalPresentationStyle = .fullScreen
                self.present(tabbar!, animated: true, completion: nil)
                Helpers.showAlertView(vc: self, msg: message)
               
             }else{
                 Helpers.showAlertView(vc: self, msg: message)
             }
        }

        signupVM.deleteAllUsers()
        signupVM.addUser(name: Helpers.readPreference(key: "name", defualt: ""), dob:  Helpers.readPreference(key: "dob", defualt: ""), height: Int64.init( Helpers.readPreference(key: "height", defualt: ""))!, weight: Int64.init( Helpers.readPreference(key: "weight", defualt: ""))!, gender:  Helpers.readPreference(key: "gender", defualt: ""), goal:  Helpers.readPreference(key: "goal", defualt: ""), active:  Helpers.readPreference(key: "activity", defualt: ""))
        
 
        
    }
    
    
    
    //Setting up the validation process
    var validation = Validation()
    
    // Getting info from Model to ViewModel.
    func Inputvalidation() {
        let isValidateName = self.validation.validateName(name: name_txt.text ?? "")
        let isValidateWeight = self.validation.validateWeight(weight:current_weight.text ?? "" )
        let isValidateHeight = self.validation.validateWeight(weight:current_height.text ?? "" )
        let isValidDate = self.validation.validateAge(birthDate: datePicker.date)
        
        // validating name
        if (isValidateName == false) {
            Helpers.showAlertView(vc: self, msg: "Name field must be filled and only accepts letters")
            return
        }
        
        // Validating Weight
        if( isValidateWeight == false) {
            Helpers.showAlertView(vc: self, msg: "Age field must be filled and cannot contains any letters or special characters")
            return
        }
        
        // Validating Height
        if( isValidateHeight == false) {
            Helpers.showAlertView(vc: self, msg: "Height field must be filled and cannot contains any letters or special characters")
            return
        }
        
        // Validating Date picker and the date should be validate as such the age between 18-100
        if (isValidDate == false) {
            Helpers.showAlertView(vc: self, msg: "Birthday Must be between 18 and 100 years old")
            return
        }
        //self.performSegue(withIdentifier: "goal", sender: self)
    }
    
    func setUserInfo(){
        
        //Sets userDefualts
        Helpers.writePreference(key: "name", data: name_txt.text!)
        Helpers.writePreference(key: "weight", data: current_weight.text!)
        Helpers.writePreference(key: "height", data: current_height.text!)
        
        //for move to next screen
        self.performSegue(withIdentifier: "goal", sender: self)
    }
}
