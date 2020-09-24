//
//  SplashController.swift
//  CalorieCounterApp
//
//  created by Timal Pathirana on 27/8/20.
//

import UIKit

class SplashController: UIViewController {

    @IBOutlet weak var trackCImage: UIImageView!
    @IBOutlet weak var trackWaterImg: UIImageView!
    @IBOutlet weak var followMImg: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    
    
    @IBOutlet weak var getStartButton: orangeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func get_started_listener(_ sender: UIButton) {
        //reading userDefaults
        let name = Helpers.readPreference(key: "name", defualt: "")
        let dob = Helpers.readPreference(key: "dob", defualt: "")
        let weight = Helpers.readPreference(key: "weight", defualt: "")
        let height = Helpers.readPreference(key: "height", defualt: "")
        
        //conditional sugue
        if(name != "" && dob != "" && weight != "" && height != ""){
            performSegue(withIdentifier: "home", sender: self)
        }else{
            performSegue(withIdentifier: "started", sender: self)
        }
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
       // Helpers.writePreference(key: "activity", data: "")
      // Helpers.writePreference(key: "goal", data: "")
        Helpers.writePreference(key: "name", data: "")
        Helpers.writePreference(key: "dob", data: "")
        Helpers.writePreference(key: "weight", data: "")
        Helpers.writePreference(key: "height", data: "")
        
        getStartButton.setTitle("Get Started", for: .normal)
        Helpers.showAlertView(vc: self, msg: "Logging out successfull")
    }

}
