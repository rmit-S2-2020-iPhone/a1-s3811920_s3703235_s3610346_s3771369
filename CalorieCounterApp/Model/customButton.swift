//
//  customButton.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 4/9/20.
//

import Foundation
import UIKit


import UIKit

class orangeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        // setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = Colors.orangeColour
        titleLabel?.font     = UIFont(name: "Helvetica", size: 18)
        layer.cornerRadius   = 10
        //layer.borderWidth    = 1.0
        //  layer.borderColor    = UIColor.black.cgColor
    }
}

class BlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        // setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = Colors.blueColour
        titleLabel?.font     = UIFont(name: "Helvetica", size: 18)
        layer.cornerRadius   = 10
        //  layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.black.cgColor
    }
}

