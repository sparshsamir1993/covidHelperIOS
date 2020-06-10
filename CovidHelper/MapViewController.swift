//
//  MapViewController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-10.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//


import UIKit
import MapKit

class MapViewCOntroller: UIViewController {
   
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set initial location in Honolulu
        


            
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mapView = MKMapView()
        
        mapView.isZoomEnabled = true
        let waterloo: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.475346,longitude:-80.529899)
        mapView.setCenter(waterloo, animated: true)
        view = mapView
    }
}
