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

        


            
    }
    
    func addCustomAnnotation(coordinates coord: CLLocationCoordinate2D, named title: String, onMap mapView: MKMapView)->MKMapView{
        let customPin = MKPointAnnotation() // this is for setting up a pin on the coordinates desired
        customPin.coordinate = coord
        customPin.title = title
        mapView.addAnnotation(customPin)
        return mapView
    }
    
    override func viewDidAppear(_ animated: Bool) {         // function that runs each time a view appears on the screen
        mapView = MKMapView()
        mapView.isZoomEnabled = true
        let waterloo: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.462434,longitude:-80.521932) //setting the coordinates of waterloo as CLLocationCoordinate2D object as its required by mapkit to center it to the location and for MKPointAnnotation to set the pin
        let grHospital:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.457655,longitude:-80.512627)
        let saintMarys:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.439279,longitude:-80.501635)
        let saintMarysTestCenter:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.461801, longitude:-80.536998)
        mapView = addCustomAnnotation(coordinates: grHospital, named: "Grand River Hopital", onMap: mapView)
        mapView = addCustomAnnotation(coordinates: saintMarys, named: "St. Mary’s General Hospital", onMap: mapView)
        mapView = addCustomAnnotation(coordinates: saintMarysTestCenter, named: "St Mary's COVID-19 Testing Clinic", onMap: mapView)
        mapView = addCustomAnnotation(coordinates: waterloo, named: "Waterloo", onMap: mapView)
        let waterlooRegion = MKCoordinateRegion(center: waterloo, latitudinalMeters: 15000, longitudinalMeters: 5000) // using MKCoordinateRegion to set proper zoom level on waterloo
        mapView.setRegion(waterlooRegion, animated: true)
        view = mapView                  // setting the view as the configured mapView
    }
}
