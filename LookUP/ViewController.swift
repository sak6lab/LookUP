//
//  ViewController.swift
//  LookUP
//
//  Created by Saketh D on 8/14/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    var week: Week!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        let locationManager = CLLocationManager()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }


    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue = manager.location!.coordinate
        self.week = Week(lat: "\(locValue.latitude)", lon: "\(locValue.longitude)")
        week.downloadWeekDetails { () -> () in
            print("complete")
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DayCell()
    }

}

