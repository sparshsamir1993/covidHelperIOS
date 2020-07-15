//
//  Hospital.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-11.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class Hospital : NSObject {
    var name : String
    var contact: String
    var id: Int
    var latitude: Double
    var longitude: Double
    
    init(id: Int, name: String, contact: String, lat: Double, lng: Double){
        self.name = name
        self.contact = contact
        self.id = id
        self.latitude = lat
        self.longitude = lng
        super.init()
    }
    
}
