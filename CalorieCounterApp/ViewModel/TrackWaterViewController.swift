//
//  TrackWaterViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import Foundation
import UIKit

class TrackWaterViewController: ViewController {
    
    @IBOutlet weak var oz: UILabel!
    
    var totalGls: Int!
    var totalOz: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalGls = 0
        totalOz = 0
        oz.text = String(totalGls) + "gl " + String(totalOz) + "oz"
    }
    
    @IBAction func onegls(_ sender: UIButton) {
        
        totalGls += 1
        totalOz += 5
        oz.text = String(totalGls) + "gl " + String(totalOz) + "oz"
    }
    
    
    @IBAction func fivegls(_ sender: UIButton) {
        totalGls += 5
        totalOz += 25
        oz.text = String(totalGls) + "gl " + String(totalOz) + "oz"
    }
    
    
    @IBAction func eightgls(_ sender: UIButton) {
        totalGls += 8
        totalOz += 40
        oz.text = String(totalGls) + "gl " + String(totalOz) + "oz"
    }
    
    
    @IBAction func twelvegls(_ sender: UIButton) {
        totalGls += 12
        totalOz += 60
        oz.text = String(totalGls) + "gl " + String(totalOz) + "oz"
    }
    
    
}
