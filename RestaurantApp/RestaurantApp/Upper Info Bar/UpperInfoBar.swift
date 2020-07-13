//
//  UpperInfoBar.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/28/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit

class UpperInfoBar: NSObject {
    
    var passedInView:UIView?
    var upperBar:UIView?
    
    var mainInfoLabel:UILabel?
    var secondaryInfoLabel:UILabel?
    var leftInfoLabel:UILabel?
    var centerInfoLabel:UILabel?
    var rightInfoLabel:UILabel?
    
    init(view: UIView) {
        super.init()
        
        passedInView = view
        self.createUpperBar()
    }
    
    func createUpperBar() {
        
        // creating the upper bar //
        upperBar = UIView(frame: CGRect(x: 10.0, y: 40.0, width: (self.passedInView?.frame.size.width)! - 20.0, height: 100.0))
        upperBar?.backgroundColor = Colors.sharedInstance.blackTransparent
        upperBar?.layer.cornerRadius = 20.0
        upperBar?.clipsToBounds = true
        
        
        // creating the main info label //
        mainInfoLabel = UILabel(frame: CGRect(x: 10.0, y: 10.0, width: (self.upperBar?.frame.size.width)! - 20.0, height: 30.0))
        mainInfoLabel?.text = "Round Table Pizza"
        mainInfoLabel?.textColor = Colors.sharedInstance.lightBlue
        mainInfoLabel?.textAlignment = .center

        
        // creating the secondary info label //
        secondaryInfoLabel = UILabel(frame: CGRect(x: 10.0, y: (self.mainInfoLabel?.frame.origin.y)! + (self.mainInfoLabel?.frame.size.height)! + 2.0, width: (self.mainInfoLabel?.frame.size.width)!, height: 20.0))
        secondaryInfoLabel?.text = "Pizza"
        secondaryInfoLabel?.textColor = UIColor.white
        secondaryInfoLabel?.textAlignment = .center

        
        // creating the left info label //
        // giving this label roughly 1/3 the width of the secondary info label //
        leftInfoLabel = UILabel(frame: CGRect(x: 10.0, y: (self.secondaryInfoLabel?.frame.origin.y)! + (self.secondaryInfoLabel?.frame.size.height)! + 10.0, width: ((self.secondaryInfoLabel?.frame.size.width)! / 3) - 3.33, height: 20.0))
        leftInfoLabel?.text = "5 Stars"
        leftInfoLabel?.textColor = UIColor.white
        leftInfoLabel?.textAlignment = .center

        
        // creating the center info label //
        // giving this label roughly 1/3 the width of the secondary info label //
        centerInfoLabel = UILabel(frame: CGRect(x: (self.leftInfoLabel?.frame.origin.x)! + ((self.leftInfoLabel?.frame.size.width)!) + 5.0, y: (self.secondaryInfoLabel?.frame.origin.y)! + (self.secondaryInfoLabel?.frame.size.height)! + 10.0, width: ((self.secondaryInfoLabel?.frame.size.width)! / 3) - 3.33, height: 20.0))
        centerInfoLabel?.text = "Open Now"
        centerInfoLabel?.textColor = UIColor.white
        centerInfoLabel?.textAlignment = .center

        
        // creating the right info label //
        // giving this label roughly 1/3 the width of the secondary info label //
        rightInfoLabel = UILabel(frame: CGRect(x: (self.centerInfoLabel?.frame.origin.x)! + ((self.centerInfoLabel?.frame.size.width)!) + 5.0, y: (self.secondaryInfoLabel?.frame.origin.y)! + (self.secondaryInfoLabel?.frame.size.height)! + 10.0, width: ((self.secondaryInfoLabel?.frame.size.width)! / 3) - 3.33, height: 20.0))
        rightInfoLabel?.text = "10 miles"
        rightInfoLabel?.textColor = UIColor.white
        rightInfoLabel?.textAlignment = .center

        
        
        
        
        // adding the views to... the view //
        self.passedInView?.addSubview(upperBar!)
        
        self.upperBar?.addSubview(mainInfoLabel!)
        self.upperBar?.addSubview(secondaryInfoLabel!)
        self.upperBar?.addSubview(leftInfoLabel!)
        self.upperBar?.addSubview(centerInfoLabel!)
        self.upperBar?.addSubview(rightInfoLabel!)
    }

}
