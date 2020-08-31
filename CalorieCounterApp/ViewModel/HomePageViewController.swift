//
//  HomePageViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet var options: [UIButton]!
    
    func configureButtons(){
       for button in options {
           button.layer.cornerRadius = 16.8
       }
    }
    
    override func viewDidLoad() {
        configureButtons()
    }
}
