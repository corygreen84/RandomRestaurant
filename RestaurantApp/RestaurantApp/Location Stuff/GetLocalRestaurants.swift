//
//  GetLocalRestaurants.swift
//  RestaurantApp
//
//  Created by Cory Green on 7/6/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import CoreLocation

class GetLocalRestaurants: NSObject {
    
    var location:CLLocation?

    override init() {
        super.init()
    }
    
    func lookUpRestaurantsByLocation(location: CLLocation){
        self.location = location
        
        let longitude = self.location!.coordinate.longitude
        let latitude = self.location!.coordinate.latitude
        
        let key = "AIzaSyAbrSfOKkZEFVCLYk254tLC3dNGX3k7yiU"
        
        let urlString = URL(string:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(longitude),\(latitude)&radius=500&types=food&key=\(key)")
        
        let task = URLSession.shared.dataTask(with: urlString!, completionHandler: { (data, response, error) in
          // your code here
            
            print(data)
            print(response)
        })

        task.resume()
    }
}
