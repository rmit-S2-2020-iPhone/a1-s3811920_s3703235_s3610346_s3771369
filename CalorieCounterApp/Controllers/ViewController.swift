//
//  ViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 30/7/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var currentWeightLabel: UITextField!
    
    @IBOutlet weak var currentHeightLabel: UITextField!
    
    @IBOutlet weak var maleTapped: UIButton!
    
    @IBOutlet weak var femaleTapped: UIButton!
    
    
    @IBAction func nextPressed1(_ sender: UIButton) {
        
        let inputName = String(nameField.text!)
        let inputdob  = Double(dobField.text!)
        let inputCurrentWeight  = Double(currentWeightLabel.text!)
        let inputCurrentHeight  = Double(currentHeightLabel.text!)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        
        
        

    }


}

