//
//  DataModel.swift
//  Project UAS
//
//  Created by iosdev on 5/13/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class DataModel{
    private var _lat: Double?
    private var _lng: Double?
    typealias JSONStandard = Dictionary<String, AnyObject>
    
    
    static var url = URL(string: "http://maps.googleapis.com/maps/api/geocode/json?address=kemayoran,jakarta")!
    
    static func changeURL(text: String, text2: String) {
        
        url = URL(string: "http://maps.googleapis.com/maps/api/geocode/json?address=\(text),\(text2)")!
        
    }
    
    
    var lat: Double{
        return _lat ?? 0
    }
    var lng: Double{
        return _lng ?? 0
    }
    
    

    func downloadData(completed: @escaping ()-> ()) {
        //SVProgressHUD.show()
        Alamofire.request(DataModel.url).responseJSON(completionHandler: {
            response in
            //debugPrint(response)
            let hasil = response.result
            if let dict = hasil.value as? JSONStandard,
                let results = dict["results"] as? [JSONStandard],
                let geometry = results[0]["geometry"] as? JSONStandard,
                let location = geometry["location"] as? JSONStandard
                
            {
                
                
                let lat = location["lat"]
                print("lat: \(lat!)")
                
                let lng = location["lng"]
                print("lng: \(lng!)")
                
                self._lat =  lat as? Double
                self._lng = lng as? Double
                
            }
            
            completed()
            
        })
        SVProgressHUD.dismiss(withDelay: 0.5)
    }
    
}
