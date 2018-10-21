//
//  Helper.swift
//  Collecting_Arts
//
//  Created by Bhumi kathiria on 14/06/18.
//  Copyright © 2018 Bhumi kathiria. All rights reserved.
//

import Foundation
import  UIKit

public class Helper
{
    static let sharedInstance = Helper()
    var appDelegate : AppDelegate?
    
    
    func checkIntenetConnection() -> Bool
    {
        if Reachability.isConnectedToNetwork()
        {
            print("Internet Connection Available!")
            return true
        }
        else
        {
            print("Internet Connection not Available!")
            return false
            
        }
        
    }
    
    
    

}
