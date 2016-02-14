//
//  MapViewController.swift
//  fleetFox
//
//  Created by Venkat Kotu on 2/12/16.
//  Copyright © 2016 VenkatKotu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController ,CLLocationManagerDelegate, MKMapViewDelegate{
    var locationManager = CLLocationManager()
    var currentlat:CLLocationDegrees = 0.0
    var currentLong:CLLocationDegrees = 0.0
        var receivedMachineId: String = ""
    
    @IBOutlet weak var inpLat: UITextField!
    
    @IBOutlet weak var inpLong: UITextField!
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
       // print("locations = \(locValue.latitude) \(locValue.longitude)")
        currentlat = locValue.latitude
        currentLong = locValue.longitude
    }
    @IBAction func updateLocation(sender: AnyObject) {
        
 
        let latitude = (inpLat.text! as NSString).doubleValue
    
        
        let longitude = (inpLong.text! as NSString).doubleValue
        print("here")
        print(latitude)
        print(longitude)
        let lat1:CLLocationDegrees = latitude
        let long1:CLLocationDegrees = longitude
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat1, long1)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "RapidBizz apps"
        annotation.subtitle = "HeadQuarters"
        map.addAnnotation(annotation)
        
        if let retrievedDict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment") as? Dictionary<String,Dictionary<String,String>> {
            var myDict = retrievedDict
            var newDict = myDict["\(receivedMachineId)"]
            
            newDict!["lat"] = "\(lat1)"
            newDict!["long"] = "\(long1)"
            
            
            
            myDict["\(receivedMachineId)"] = newDict
            NSUserDefaults.standardUserDefaults().setObject(myDict, forKey: "equipment")
            
            let now = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment")
            print("here111")
            print(now)
        }
        
        
    }
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("mcahine id from second")
        print(receivedMachineId)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        // Do any additional setup after loading the view.

        let latitude:CLLocationDegrees = 37.332095
        
        let longitude:CLLocationDegrees = -122.030754
        
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Current Location"
        annotation.subtitle = "Apple"
        map.addAnnotation(annotation)
        if let retrievedDict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment") as? Dictionary<String,Dictionary<String,String>> {
            var myDict = retrievedDict
            var newDict = myDict["\(receivedMachineId)"]
            
            newDict!["lat"] = "\(latitude)"
            newDict!["long"] = "\(longitude)"
            
            
            
            myDict["\(receivedMachineId)"] = newDict
            NSUserDefaults.standardUserDefaults().setObject(myDict, forKey: "equipment")
            
            let now = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment")
            print("here2222")
            print(now)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailsController: ShowDetailsViewController = segue.destinationViewController as! ShowDetailsViewController
        detailsController.receivedMachineId = receivedMachineId
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
