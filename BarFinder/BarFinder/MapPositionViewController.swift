//
//  MapPositionViewController.swift
//  BarFinder
//
//  Created by Kaloian on 2/6/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPositionViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.requestWhenInUseAuthorization();
        self.locationManager.startUpdatingLocation();
        self.mapView.showsUserLocation = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last;
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude);
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:0.2, longitudeDelta: 0.2));
        self.mapView.setRegion(region, animated: true);
        self.locationManager .stopUpdatingLocation();
        
    }
}
