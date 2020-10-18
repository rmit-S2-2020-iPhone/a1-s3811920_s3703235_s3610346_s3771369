
//  CalorieCounterApp
//
//  Created by Timal Pathirana on 2/10/20.
//

import Foundation
import Alamofire

class Connectivity{
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

