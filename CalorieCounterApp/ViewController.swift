//
//  ViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 30/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var options: [UIButton]!
    
    @IBOutlet var waterglass: [UIButton]!
    
    
    func configureButtons(){
        for button in options {
            button.layer.cornerRadius = 20.8
        }
        
        for button in waterglass {
            button.layer.cornerRadius = 20.8
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
}
    
}
