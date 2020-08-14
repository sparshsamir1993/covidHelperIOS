//
//  Hospital+CoreDataProperties.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-08-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//
//

import Foundation
import CoreData


extension Hospital {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hospital> {
        return NSFetchRequest<Hospital>(entityName: "Hospital")
    }

    @NSManaged public var hospitalID: String?
    @NSManaged public var name: String?
    @NSManaged public var contact: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
