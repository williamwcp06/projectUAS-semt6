//
//  ViewController.swift
//  Project UAS
//
//  Created by iosdev on 4/29/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import SVProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var inputPlaceTextField: UITextField!
    @IBOutlet weak var inputCityTextField: UITextField!
    @IBOutlet weak var latCoordinateLabel: UILabel!
    @IBOutlet weak var lngCoordinateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
           }
    
    override func viewDidAppear(_ animated: Bool) {
        
        inputCityTextField.text = nil
        inputPlaceTextField.text = nil
        latCoordinateLabel.text = nil
        lngCoordinateLabel.text = nil
        
    }
    
    // find coordinates
    var location = DataModel()
    
    @IBAction func btnFindCoordinates(_ sender: Any) {
        
        SVProgressHUD.show()
        
        let historyList = UserDefaults.standard.object(forKey: "history")
        let combineInput = inputPlaceTextField.text! + ", " + inputCityTextField.text!
        var history: [String]
        if let tempHistory = historyList as? Array<String>{
            history = tempHistory
            
            history.append(combineInput)
            
        } else{
            history = [combineInput]
        }
        
        let tempPlace = String(inputPlaceTextField.text!.characters.filter { !" \n\t\r".characters.contains($0) })
        let tempCity = String(inputCityTextField.text!.characters.filter { !" \n\t\r".characters.contains($0) })
        DataModel.changeURL(text: tempPlace, text2: tempCity)
        print(tempPlace)
        
        UserDefaults.standard.set(history, forKey:"history")
        
        
        //location
        location.downloadData {
            let tempLat = self.location.lat
            let tempLng = self.location.lng
            self.latCoordinateLabel.text = "\(tempLat)"
            self.lngCoordinateLabel.text = "\(tempLng)"
            
        }
    }
    
   
    
    // find map

    
    @IBAction func seeOnMappButton(_ sender: Any) {
        SVProgressHUD.show()
        performSegue(withIdentifier: "segueMap", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let det = segue.destination as!SecondViewController
        det.lat = latCoordinateLabel.text!
        det.lng = lngCoordinateLabel.text!
        det.city = inputCityTextField.text!
        det.place = inputPlaceTextField.text!
        
    }
 
    
    
    
    
    //refresh
    @IBAction func refreshButton(_ sender: Any) {
        inputCityTextField.text = ""
        inputPlaceTextField.text = nil
        latCoordinateLabel.text = nil
        lngCoordinateLabel.text = nil
        
//        print("Sd")

    }
    
    
    
    
    // history
    
    @IBAction func btnTappedHistory(_ sender: Any) {
        
        
    }
    
}
