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
    var list : [Int : Dictionary<String, String>] = [1: ["name": "GRH Hospital", "contact": "987654321"],
                               2: ["name": "victoria Hospital", "contact": "987654000321"]]
    
    @discardableResult func createItem(id: Int, hospital: Dictionary<String, String>)->Hospital {
        let newHospital = Hospital(id: id, name: hospital["name"]!, contact: hospital["contact"]!)
        allHospitals.append(newHospital)
//        print(allHospitals.count)
        return newHospital
    }
    init() {
       for (id, hospital) in list {
            
            createItem(id: id, hospital: hospital)
        }
    }
}
