//
//  TrackWaterViewController.swift
//  CalorieCounterApp
//
//  Created by Abida Mohammadi on 31/8/20.
//

import Foundation
import UIKit

class TrackWaterViewController: ViewController {
    
    
    
    
    @IBOutlet weak var titleLabel: TitleLable!
    @IBOutlet weak var waterDisplayLable: TextLable!
    
    
    @IBAction func oneGBtn(_ sender: orangeButton) {
        totalGls += 1
        totalOz += 5
        getWaterAmount()
    }
    
    
    @IBAction func fiveGBtn(_ sender: orangeButton) {
        totalGls += 5
        totalOz += 25
        getWaterAmount()
    }
    
    
    @IBAction func eightGBtn(_ sender: orangeButton) {
        totalGls += 8
        totalOz += 40
        getWaterAmount()
    }
    
    @IBAction func twlGBtn(_ sender: orangeButton) {
        totalGls += 12
        totalOz += 60
        getWaterAmount()
    }
    
    @IBAction func removeBtn(_ sender: BlueButton) {
        if (totalGls == 0){
            return
        }
        else {
        totalGls = totalGls - 1
        totalOz = totalOz - 5
        getWaterAmount()
        }
    }
    
    
    var totalGls: Int!
    var totalOz: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalGls = 0
        totalOz = 0
        getWaterAmount()
    }
    
    
    
    func getWaterAmount() {
        waterDisplayLable.text = String(totalGls) + "gl \t"  + String(totalOz) + "oz"
        
    }
    
}
