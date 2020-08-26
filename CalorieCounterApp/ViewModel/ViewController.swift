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
    
    
    var personalDataObj = personalInfoSet.init(name: "Timal", currentWeight: 80, currentHeight: 150)
    


    override func viewDidLoad() {
        super.viewDidLoad()
    //    configureButtons()
       
           }

}
