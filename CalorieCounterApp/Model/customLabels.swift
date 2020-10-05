//
//  customLabels.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 6/9/20.
//

import Foundation
import UIKit

class TitleLable:UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    func setupLabel() {
        
        font = UIFont(name: "Helvetica Neue Thin", size: 25)
        textColor = UIColor.black
    }
}

class TextLable:UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame) 
        setupTextLabel()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextLabel()
    }
    
    
    func setupTextLabel() {
        font = UIFont(name: "Helvetica Neue Thin", size: 18)
        textColor = UIColor.black
    }
}




