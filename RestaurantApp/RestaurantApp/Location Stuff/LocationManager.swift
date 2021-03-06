//
//  LocationManager.swift
//  RestaurantApp
//
//  Created by Cory Green on 6/27/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

@objc protocol ReturnLocationDataDelegate{
    func returnLocationData(data:CLLocation)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var delegate: ReturnLocationDataDelegate?
    
    var locationManager: CLLocationManager?
    var locationServicesOn: Bool?
    
    override init() {
        super.init()
        
        locationServicesOn = false
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = kCLLocationAccuracyBestForNavigation
        locationManager?.requestAlwaysAuthorization()
    }
    
    func getLocationDataOnce() {
        locationManager?.requestLocation()
    }
    
    func startLocationServices(){
        locationServicesOn = true
        locationManager?.startUpdatingLocation()
    }
    
    func stopLocationServices() {
        locationServicesOn = false
        locationManager?.stopUpdatingLocation()
    }
    
    
    // when the location status changes //
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        print(status)
        
    }
    
    // gets the users location //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if(locationServicesOn!){
            if(locations.last!.horizontalAccuracy >= 5.0){
                self.stopLocationServices()
                self.delegate?.returnLocationData(data: locations.last!)
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error -> \(error)")
    }
}
