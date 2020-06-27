//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/13/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, ReturnLocationDataDelegate {

    @IBOutlet weak var mainMap: MKMapView!
    
    var bottomButtons:BottomButtons?
    
    var locationData:LocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainMap.delegate = self
        
        // creating the bottom buttons //
        bottomButtons = BottomButtons(view: self.view)
        
        // starting up the location manager and adjusting mainmap settings //
        locationData = LocationManager()
        locationData?.delegate = self
        locationData?.getLocationDataOnce()
        
    }
    
    // return data from the locationManager class //
    func returnLocationData(data: CLLocation) {
        
    }


}

