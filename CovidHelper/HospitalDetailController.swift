//
//  HospitalDetailController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-14.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit
import MapKit

class HospitalDetailController: UIViewController {
    
    var hospital : Hospital!
    
    @IBOutlet var HospitalNameLabel: UILabel!
    
    @IBOutlet var HospitalNameLabelValue: UILabel!
    
    @IBOutlet var HospitalContactLabel: UILabel!
    @IBOutlet var HospitalContactLabelValue: UILabel!
    @IBOutlet var HospitalLocationMap: MKMapView!
    @IBOutlet var hospView: UIView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    func addCustomAnnotation(coordinates coord: CLLocationCoordinate2D, named title: String, onMap mapView: MKMapView)->MKMapView{
        // function takes in the mapView to set the annotation on, sets it and retuns the same updated mapView
        let customPin = MKPointAnnotation() // this is for setting up a pin on the coordinates desired
        customPin.coordinate = coord
        customPin.title = title
        mapView.addAnnotation(customPin)
        return mapView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        HospitalLocationMap = MKMapView()
        HospitalLocationMap.isZoomEnabled = true
        let waterloo: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:hospital.latitude,longitude:hospital.longitude)
        HospitalLocationMap = addCustomAnnotation(coordinates: waterloo, named: hospital.name!, onMap: HospitalLocationMap)
        let waterlooRegion = MKCoordinateRegion(center: waterloo, latitudinalMeters: 15000, longitudinalMeters: 5000) // using MKCoordinateRegion to set proper zoom level on waterloo
        let leftMargin:CGFloat = 00
        let topMargin:CGFloat = 00
        let mapWidth:CGFloat = hospView.frame.size.width 
        let mapHeight:CGFloat = hospView.frame.size.height
        
        HospitalLocationMap.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        HospitalLocationMap.setRegion(waterlooRegion, animated: true)
        HospitalLocationMap.sizeThatFits(CGSize(width: 200, height: 200))
        hospView.addSubview(HospitalLocationMap)
        hospView = HospitalLocationMap
        HospitalNameLabelValue.text = hospital?.name
        HospitalContactLabelValue.text = hospital?.contact
    }
    
    @IBAction func backToHospitalList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToList", sender: HospitalDetailController.self)
    }
    
}
