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
    
    var usersLocation:CLLocation?
    
    var upperBar:UpperInfoBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainMap.delegate = self
        mainMap.showsUserLocation = true
        
        // creating the bottom buttons //
        bottomButtons = BottomButtons(view: self.view)
        bottomButtons?.disableButtons()
        
        // starting up the location manager and adjusting mainmap settings //
        locationData = LocationManager()
        locationData?.delegate = self
        //locationData?.getLocationDataOnce()
        locationData?.startLocationServices()
        
        upperBar = UpperInfoBar(view: self.view)
        
    }
    
    // return data from the locationManager class //
    func returnLocationData(data: CLLocation) {
        usersLocation = data
        
        bottomButtons?.enableButtons()
        
        // creating a coordinate2d based on their location //
        let userLocationToCoordinate2d:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: usersLocation!.coordinate.latitude, longitude: usersLocation!.coordinate.longitude)
        
        // creating an mkCoordinateRegion based on the coordinate2d info //
        let mkCoordinateRegion:MKCoordinateRegion = MKCoordinateRegion(center: userLocationToCoordinate2d, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        // setting the region to hte mainMap //
        mainMap.setRegion(mkCoordinateRegion, animated: true)
        
        let getLocalRestaurants:GetLocalRestaurants = GetLocalRestaurants()
        getLocalRestaurants.lookUpRestaurantsByLocation(location: usersLocation!)
        
    }


}

