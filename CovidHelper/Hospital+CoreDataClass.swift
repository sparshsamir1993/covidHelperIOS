//
//  Hospital+CoreDataClass.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-08-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Hospital)
public class Hospital: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        name=""
        hospitalID = ""
        contact = ""
        longitude = 0
        latitude = 0
    }

}
