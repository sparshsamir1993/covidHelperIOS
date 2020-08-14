//
//  CacheStore.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-08-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class CacheStore {
    let cache = NSCache<NSString, Hospital>()
    
    func setHospital(_ hospital: Hospital, forKey key: NSString) {
        cache.setObject(hospital, forKey: key as NSString)
    }
    
    func hospital(forKey key: NSString)->Hospital? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteHospital(forKey key:NSString) {
        cache.removeObject(forKey: key as NSString)
    }
}
