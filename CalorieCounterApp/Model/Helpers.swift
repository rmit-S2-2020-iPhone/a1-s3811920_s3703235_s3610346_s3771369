//
//  Helpers.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 27/8/20.
//

import Foundation
import UIKit


class Helpers{
    
    static var appcolor=0xEE9A39
    static var touchedColour=0x4E5574
    static let preferences = UserDefaults.standard

    static func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
       let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
       let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
       let blue = CGFloat(rgbValue & 0xFF)/256.0
       return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    static func writePreference(key: String,data: String){
        
        preferences.set(data, forKey: key)
        preferences.synchronize()
    }
    
    static func readPreference(key:String,defualt:String) -> String{
        
        if preferences.object(forKey: key) == nil {
            return defualt
        } else {
            let current = preferences.string(forKey: key)
            return current!
        }
    }
    static func showAlertView(vc:UIViewController,msg:String){
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        vc.present(alert, animated: true, completion: nil)
    }
  

   
}

