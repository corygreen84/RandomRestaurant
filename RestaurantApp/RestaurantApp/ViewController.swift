//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/13/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mainMap: MKMapView!
    
    var bottomButtons:BottomButtons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bottomButtons = BottomButtons(view: self.view)
    }


}

