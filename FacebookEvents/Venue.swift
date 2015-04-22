//
//  Venue.swift
//
//  Created by Simen Johannessen on 24/03/15.
//  Copyright (c) 2015 Simen Lomås Johannessen. All rights reserved.
//

import Foundation

class Venue {
    let city: String
    let latitude: Double
    let longitude: Double
    
    init(city: String, latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
    }
}