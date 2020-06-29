//
//  BottomButtons.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/14/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit

class BottomButtons: NSObject {
    
    var passedInView:UIView?
    var nextButton:UIButton?
    var backButton:UIButton?
    
    var startButtonClicked:Bool?
    
    var nextCount:Int = 0
    
    init(view: UIView) {
        super.init()
        
        passedInView = view
        
        self.createButtons()
    }
    
    func createButtons(){
        // the next button will start out as 'Start' then will change //
        // to next //
        self.startButtonClicked = false
        nextButton = UIButton(frame: CGRect(x: 0.0, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: (self.passedInView?.frame.size.width)!, height: 75.0))
        nextButton?.setTitle("Start", for: UIControl.State.normal)
        nextButton?.setTitleColor(UIColor.black, for: UIControl.State.normal)
        nextButton?.backgroundColor = Colors.sharedInstance.green
        nextButton?.addTarget(self, action: #selector(nextButtonOnClick), for: UIControl.Event.touchUpInside)
        
        self.passedInView?.addSubview(nextButton!)
        
        backButton = UIButton(frame: CGRect(x: (self.passedInView?.frame.size.width)!, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: 0.0, height: 75.0))
        backButton?.setTitle("Back", for: UIControl.State.normal)
        backButton?.setTitleColor(UIColor.white, for: UIControl.State.normal)
        backButton?.backgroundColor = Colors.sharedInstance.lightBlue
        backButton?.addTarget(self, action: #selector(backButtonOnClick), for: UIControl.Event.touchUpInside)
        
        self.passedInView?.addSubview(backButton!)
        
    }
    
    // next button on click //
    // adds to the next count //
    @objc func nextButtonOnClick() {
        startButtonClicked = true
        nextCount = nextCount + 1
        moveNextButtonToTheLeft()
    }
    
    // back button on click //
    // subtracts from the next count //
    // when it gets to 0, it takes away the back button //
    // and adds back in the next button //
    @objc func backButtonOnClick() {
        nextCount = nextCount - 1
        if(nextCount == 0){
            moveNextButtonToTheRight()
        }
    }
    
    
    func moveNextButtonToTheLeft() {
        UIView.animate(withDuration: 0.2) {
            self.nextButton?.frame = CGRect(x: 0.0, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: (self.passedInView?.frame.size.width)! / 2, height: 75.0)
            self.nextButton?.setTitle("Next", for: UIControl.State.normal)
            
            self.backButton?.frame = CGRect(x: (self.passedInView?.frame.size.width)! / 2, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: (self.passedInView?.frame.size.width)! / 2, height: 75.0)
            
        } completion: { (complete) in
            
        }
    }
    
    
    func moveNextButtonToTheRight() {
        UIView.animate(withDuration: 0.2) {
            self.nextButton?.frame = CGRect(x: 0.0, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: (self.passedInView?.frame.size.width)!, height: 75.0)
            self.nextButton?.setTitle("Start", for: UIControl.State.normal)
            
            self.backButton?.frame = CGRect(x: (self.passedInView?.frame.size.width)!, y: (self.passedInView?.frame.origin.y)! + (self.passedInView?.frame.size.height)! - 75.0, width: 0.0, height: 75.0)
        } completion: { (complete) in
            
        }
    }
}
