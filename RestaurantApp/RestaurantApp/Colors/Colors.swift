//
//  Colors.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/28/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit

class Colors: NSObject {
    
    static var sharedInstance = Colors()
    
    // light blue //
    var lightBlue:UIColor = UIColor(red: 0.0/255.0, green: 191.0/255.0, blue: 229.0/255.0, alpha: 1.0)
    
    // light green //
    var green:UIColor = UIColor(red: 53.0/255.0, green: 229.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    // black transparent //
    var blackTransparent:UIColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.75)

}
