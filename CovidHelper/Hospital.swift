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
    
    init(id: Int, name: String, contact: String){
        self.name = name
        self.contact = contact
        self.id = id
        super.init()
    }
    
}
