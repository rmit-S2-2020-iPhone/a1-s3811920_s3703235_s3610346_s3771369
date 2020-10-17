//
//  Connectivity.swift
//  CalorieCounterApp
//
//  Created by Hamza Arif on 09/10/2020.
//

import Foundation
import Alamofire

class Connectivity{
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

