//
//  LocationManager.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/27/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import CoreLocation

@objc protocol ReturnLocationDataDelegate{
    func returnLocationData(data:CLLocation)
}

class LocationManager: NSObject, CLLocationManagerDelegate {

    static var sharedInstance = LocationManager()
    
    var delegate: ReturnLocationDataDelegate?
    
    var locationManager: CLLocationManager?
    var locationServicesOn: Bool?
    
    override init() {
        super.init()
        
        locationServicesOn = false
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        
    }
    
    func startLocationServices(){
        locationServicesOn = true
        locationManager?.startUpdatingLocation()
    }
    
    func stopLocationServices() {
        locationServicesOn = false
        locationManager?.stopUpdatingLocation()
    }
}
