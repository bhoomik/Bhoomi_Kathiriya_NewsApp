//
//  Common.swift
//
//  Created by Bhumi kathiria on 23/05/18.
//  Copyright © 2018 Bhumi kathiria. All rights reserved.

import Foundation
import UIKit




let kBaseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key="
let kAPIKey =  "7b261f01688b435eb705cff2ab871a72"

class Common: NSObject {
    static let sharedInstance: Common = {
        let instance = Common()
        // setup code
        return instance
    }()
}

