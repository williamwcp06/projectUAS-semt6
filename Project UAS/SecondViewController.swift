//
//  SecondViewController.swift
//  Project UAS
//
//  Created by iosdev on 5/6/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import GoogleMaps
import SVProgressHUD

class SecondViewController: UIViewController {
    
    var lng = ""
    var lat = ""
    var city = ""
    var place = ""

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tempLat = Double(lat)
        let tempLng = Double(lng)
        
//        var temporary = CLLocationCoordinate2D(latitude: tempLat, longitude: tempLng)
        
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: tempLat!, longitude: tempLng!, zoom: 1.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: tempLat!, longitude: tempLng!)
        marker.title = place
        marker.snippet = city
        marker.map = mapView
        SVProgressHUD.dismiss(withDelay: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
