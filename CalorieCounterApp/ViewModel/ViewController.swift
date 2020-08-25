//
//  ViewController.swift
//  CalorieCounterApp
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var options: [UIButton]!
    
    func configureButtons(){
        for button in options {
            button.layer.cornerRadius = 20.8
        }
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var maleTapped: UIButton!
    
    @IBOutlet weak var femaleTapped: UIButton!
    
    
    @IBAction func nextPressed1(_ sender: UIButton) {
        
        let inputName = String(nameField.text!)
        let inputdob  = Double(dobField.text!)
        let inputCurrentWeight  = Double(weightField.text!)
        let inputCurrentHeight  = Double(heightField.text!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }

}
