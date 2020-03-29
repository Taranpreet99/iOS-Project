//
//  MapViewController.swift
//  PetAssist
//
//  Created by Xcode User on 2020-03-29.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var matchingItems: [MKMapItem]!

    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    @IBAction func findPetStore(_ sender: Any) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Pet Stores"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil{
                print ("Error")
            }else if response!.mapItems.count == 0{
                print("No matches found")
            }else{
                
                self.matchingItems = response?.mapItems
                
                if let updatedRegion = response?.boundingRegion{
                    self.mapView.region = updatedRegion
                }
                
                self.mapView.delegate = self
                
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "pin")
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                
                for item in self.matchingItems{
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
    
    @IBAction func findVetCare(_ sender: Any) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Veterinanrians"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil{
                print ("Error")
            }else if response!.mapItems.count == 0{
                print("No matches found")
            }else{
                
                self.matchingItems = response?.mapItems
                
                if let updatedRegion = response?.boundingRegion{
                    self.mapView.region = updatedRegion
                }
                
                self.mapView.delegate = self
                
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "pin")
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                
                for item in self.matchingItems{
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
    
    
    @IBAction func findParks(_ sender: Any) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Dog Parks"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil{
                print ("Error")
            }else if response!.mapItems.count == 0{
                print("No matches found")
            }else{
                
                self.matchingItems = response?.mapItems
                
                if let updatedRegion = response?.boundingRegion{
                    self.mapView.region = updatedRegion
                }
                
                self.mapView.delegate = self
                
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "pin")
                self.mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
                
                for item in self.matchingItems{
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
        
        if CLLocationManager.locationServicesEnabled() {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined{
                
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }else{
            print("Please")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan())
        
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access to your current location")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}