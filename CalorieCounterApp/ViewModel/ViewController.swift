//
//  ViewController.swift
//  CalorieCounterApp
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var options: [UIButton]!
<<<<<<< HEAD
    
   // func configureButtons(){
    //    for button in options {
     //       button.layer.cornerRadius = 20.8
      //  }
   // }
=======

    func configureButtons(){

            for button in options {
            button.layer.cornerRadius = 20.8
        }
    
    }
>>>>>>> 6e28af0fc6c3d6573455ee5afb29b62c385e7b1b

   /* @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
<<<<<<< HEAD
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    
=======
    @IBOutlet weak var currentWeightLabel: UITextField!

    @IBOutlet weak var currentHeightLabel: UITextField!

>>>>>>> 6e28af0fc6c3d6573455ee5afb29b62c385e7b1b
    @IBOutlet weak var maleTapped: UIButton!

    @IBOutlet weak var femaleTapped: UIButton!
<<<<<<< HEAD
    
    
   @IBAction func nextPressed1(_ sender: UIButton) {
        
        let inputName = String(nameField.text!)
        let inputdob  = Double(dobField.text!)
        let inputCurrentWeight  = Double(weightField.text!)
        let inputCurrentHeight  = Double(heightField.text!)
        
    }*/
    
=======


    @IBAction func nextPressed1(_ sender: UIButton) {

        let inputName = String(nameField.text!)
        let inputdob  = Double(dobField.text!)
        let inputCurrentWeight  = Double(currentWeightLabel.text!)
        let inputCurrentHeight  = Double(currentHeightLabel.text!)

    }

>>>>>>> 6e28af0fc6c3d6573455ee5afb29b62c385e7b1b
    override func viewDidLoad() {
        super.viewDidLoad()
     //   configureButtons()
    }

}
