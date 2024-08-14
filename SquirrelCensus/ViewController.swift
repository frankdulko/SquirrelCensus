//
//  ViewController.swift
//  SquirrelCensus
//
//  Created by Frank Dulko on 7/23/24.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    private var squirrelModel = SquirrelModel()
    private var squirrelMarkers : [GMSMarker] = []
    
    override func loadView() {

      // Load the map at set latitude/longitude and zoom level
//      let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 40.785091, longitude: -73.968285, zoom: 14)
//      let mapID = GMSMapID(identifier: "6031a7a2995ce17b")
//
//
//        mapView = GMSMapView(frame: .zero, mapID: mapID, camera: camera)
//      self.view = mapView
//      mapView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add a single marker with a custom icon
//        let mapCenter = CLLocationCoordinate2DMake(mapView.camera.target.latitude, mapView.camera.target.longitude)
//        let marker = GMSMarker(position: mapCenter)
//
//        marker.map = mapView

        
        self.squirrelModel.getSquirrelData()

    }
    


}

