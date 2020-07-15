//
//  HospitalListStore.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-11.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//
import UIKit

class HospitalListStore {
    var allHospitals = [Hospital]()
    var list : [Int : Dictionary<String, Any>] =
    [
        1: ["name": "GRH Hospital", "contact": "987654321", "latitude": 43.462434,"longitude":-80.521932],
        2: ["name": "victoria Hospital", "contact": "987654420321", "latitude": 43.462434,"longitude":-80.521932],
        3: ["name": "St. Mary's Hospital", "contact": "987633321","latitude": 43.439279,"longitude":-80.501635],
        4: ["name": "St. Mary's Test Center", "contact": "9876542421","latitude": 43.461801, "longitude":-80.536998]
    ]
    
    @discardableResult func createItem(id: Int, hospital: Dictionary<String, Any>)->Hospital {
        let newHospital = Hospital(id: id, name: hospital["name"] as! String,
                                   contact: hospital["contact"] as! String,
                                   lat: hospital["latitude"] as! Double,
                                   lng:hospital["longitude"] as! Double )
        allHospitals.append(newHospital)
        return newHospital
    }
    init() {
       for (id, hospital) in list {
            
        createItem(id: id, hospital: hospital)
        }
    }
}

