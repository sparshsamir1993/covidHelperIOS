//
//  HospitalListStore.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-11.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//
import UIKit
import CoreData

enum HospitalsResult {
    case success([Hospital])
    case failure(Error)
}
enum HospitalResult {
    case success(Hospital)
    case failure(Error)
}

class HospitalListStore {
    var allHospitals = [Hospital]()
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    let cacheStore = CacheStore()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CovidHelper")
        
        let appName: String = "CovidHelper"
        var persistentStoreDescriptions: NSPersistentStoreDescription
        
        let storeUrl = HospitalListStore.getDocumentsDirectory().appendingPathComponent("CovidHelper.sqlite")
        print(storeUrl)
        
        let description = NSPersistentStoreDescription()
        description.shouldInferMappingModelAutomatically = true
        description.shouldMigrateStoreAutomatically = true
        description.url = storeUrl
        
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func fetchHospitalListFromApi(completion: @escaping(HospitalsResult)->Void) {
        let url = HospitalAPI.hospitalApiUrl
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error)->Void in
            self.processHospitalRequest(data: data, error: error) {
                (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            }
        }
        task.resume()
    }
    
    func processHospitalRequest(data: Data?, error: Error?, completion: @escaping(HospitalsResult)->Void) {
        guard
            let jsonData = data
        else {
            completion(.failure(error!))
            return
        }
        persistentContainer.performBackgroundTask {
            (context) in
            let result = HospitalAPI.hospitals(fromJSON: jsonData, into: context)
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error)")
                completion(.failure(error))
                return
            }
            switch result {
            case let .success(hospitals):
                
                let hospitalIDs = hospitals.map {return $0.objectID}
                let viewContext = self.persistentContainer.viewContext
                let viewContextHospitals = hospitalIDs.map {return viewContext.object(with: $0)} as! [Hospital]
                completion(.success(viewContextHospitals))
            case.failure:
                print("fail")
                completion(result)
            }
        }
    }
    
    func fetchAllHospitals(completion: @escaping(HospitalsResult)->Void) {
        let fetchRequest: NSFetchRequest<Hospital> = Hospital.fetchRequest()
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            do {
                let hospitalList = try viewContext.fetch(fetchRequest)
                completion(.success(hospitalList))
            } catch {
                completion(.failure(error))
            }
        }
    }
    static func getDocumentsDirectory()-> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func fetchHospital(for hospital: Hospital, completion: @escaping (HospitalResult)->Void) {
        guard let hospitalKey = hospital.hospitalID
            else {
            preconditionFailure("hospital expected to have a hospital ID.")
        }
        if let hospital = cacheStore.hospital(forKey: hospitalKey as NSString) {
            OperationQueue.main.addOperation {
                completion(.success(hospital))
            }
            return
        }
        
       
    }
//    var list : [Int : Dictionary<String, Any>] =
//    [
//        1: ["name": "GRH Hospital", "contact": "987654321", "latitude": 43.457655,"longitude":-80.512627],
//        2: ["name": "victoria Hospital", "contact": "987654420321", "latitude": 43.462434,"longitude":-80.521932],
//        3: ["name": "St. Mary's Hospital", "contact": "987633321","latitude": 43.439279,"longitude":-80.501635],
//        4: ["name": "St. Mary's Test Center", "contact": "9876542421","latitude": 43.461801, "longitude":-80.536998]
//    ]
    
//    @discardableResult func createItem(id: Int, hospital: Dictionary<String, Any>)->Hospital {
//        let newHospital = Hospital(id: id, name: hospital["name"] as! String,
//                                   contact: hospital["contact"] as! String,
//                                   lat: hospital["latitude"] as! Double,
//                                   lng:hospital["longitude"] as! Double )
//        allHospitals.append(newHospital)
//        return newHospital
//    }
//    init() {
//       for (id, hospital) in list {
            
//        createItem(id: id, hospital: hospital) //creating new hospitals
//        }
//    }
}

