//
//  loginInfoEnum.swift
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 23/8/20.
//

import Foundation


enum ClientGoal {
    case looseWeight, gainWeight, maintainWeight
    
    init()
    {
        self = .maintainWeight
    }
    // Computed property
    var outputGoal:Int{
        switch self{
        case .looseWeight:
            return 1
        case .gainWeight:
            return 2
        case .maintainWeight:
            return 3
        }
    }
}

enum ClientActivityLevel {
    case sedentary, lightlyActive, active, veryActive
    
    init()
    {
        self = .active
    }
    // Computed property
    var outputActive:Int{
        switch self{
        case .sedentary:
            return 1
        case .lightlyActive:
            return 2
        case .active:
            return 3
        case .veryActive:
            return 4
        }
    }
}
