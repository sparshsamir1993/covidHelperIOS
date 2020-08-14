//
//  HospitalAPI.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-08-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import Foundation
import CoreData

enum Method: String {
    case hospitalListCase = "http://127.0.0.1:3000/hospitals"
}
enum FlickerError: Error {
    case invalidJSONData
}

struct HospitalAPI {
    private static let baseURLString="http://127.0.0.1:3000/hospitals"
    
    private static func HospitalAPIURL() -> URL {
        var components =  URLComponents(string: baseURLString)!
        return components.url!
    }
    
    static var hospitalApiUrl : URL {
        return HospitalAPIURL()
    }
    
    
    static func hospitals(fromJSON data: Data, into context: NSManagedObjectContext) -> HospitalsResult{
        do{
//            print("jsonObject")
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
//            print(jsonObject)
            guard
                
            let jsonDictionary = jsonObject as? [AnyHashable:Any],
            let hospitalsArray = jsonDictionary["hospital"] as? [[String:Any]]
//                let hospitalsArray = hospitals["hospital"] as? [[String:Any]]
                
            else {
//                    print("oops")
                    return .failure(FlickerError.invalidJSONData)
//
            }
            var finalHospitals = [Hospital]()
            for hospitalJSON in hospitalsArray {
                if let currentHospital = hospital(fromJSON: hospitalJSON, into: context) {
                    print("hosp id is")
                    print(currentHospital.hospitalID)
                    let arr = finalHospitals.filter{ $0.hospitalID == currentHospital.hospitalID }
                    if (arr.count == 0){
                        finalHospitals.append(currentHospital)
                    }
                        

                }
            }
            if finalHospitals.isEmpty && !hospitalsArray.isEmpty {
                return .failure(FlickerError.invalidJSONData)
            }
            return .success(finalHospitals)
            
        }catch let error {
            return .failure(error)
        }
    }
    
    static func hospital(fromJSON json: [String: Any], into context: NSManagedObjectContext) -> Hospital?{
        print(json["id"])
        print(json["name"])
        guard
            let hospitalID = json["id"] as? String,
            let name = json["name"] as? String,
            let contact = json["contact"] as? String,
            let latitude = json["latitude"] as? Double,
            let longitude = json["longitude"] as? Double
        else {
            print("somr p[roblem")
                return nil
        }
        
        let fetchRequest: NSFetchRequest<Hospital> = Hospital.fetchRequest()
        let predicate = NSPredicate(format: "\(#keyPath(Hospital.hospitalID)) == \(hospitalID)")
        fetchRequest.predicate = predicate
        
        var fetchedHospitals: [Hospital]?
        context.performAndWait {
            fetchedHospitals = try? fetchRequest.execute()
        }
        if let existingHospital = fetchedHospitals?.first {
            return existingHospital
        }
        
        
        var hospital: Hospital!
        context.performAndWait {
            hospital = Hospital(context: context)
            hospital.name = name
            hospital.contact = contact
            hospital.latitude = latitude
            hospital.longitude = longitude
            hospital.hospitalID = hospitalID
        }
        return hospital
    }
    
}

