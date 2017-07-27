//
//  Question2ViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
var userSizeValue: String = ""
var userMaxSizeValue = ""
class Question2ViewController: UIViewController {
    var devices: Devices!
    @IBOutlet weak var matchingDevices1: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
  
    @IBOutlet weak var displaySizeSliderOutlet: UISlider!
    
    @IBOutlet weak var maxSizeSliderLabel: UILabel!
    
    @IBOutlet weak var sizeRange: UILabel!
    @IBOutlet weak var displayMaxSizeSliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let apiToContact = "https://fonoapi.freshpixl.com/v1/getlatest?brand=" + valueSelected + "&token=fa3b068e2b9e81df7efa3295e02220ce66bec14716e21839"
//        Alamofire.request(apiToContact).validate().responseJSON() { response in
//            switch response.result {
//            case .success:
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    let realDevices: JSON = json[]
//                    self.devices = Devices (json: json [])
//                    for device in realDevices.arrayValue {
//                        let sizeValue = device["size"].stringValue
//                        sizeDevicesArray = sizeValue.components(separatedBy: " ")
//                        if Double(sizeDevicesArray[0]) != nil {
//                            if Double(userSizeValue)! <= Double(sizeDevicesArray[0])! && Double(userMaxSizeValue)! >= Double(sizeDevicesArray[0])! {
//                                realDevices2.append(device[])
//                            }
//                        }
//                    }
//                    for device in realDevices2 {
//                        releaseValue = device["status"].stringValue
//                        if releaseValue != "Discontinued" && releaseValue != "Rumored" && releaseValue != "Cancelled" && releaseValue != "Available" {
//                            releaseDateDevicesArray = releaseValue.components(separatedBy: " ")
//                            if Int (releaseDateDevicesArray[2]) != nil {
//                                if Int(userDateSelected)! <= Int (releaseDateDevicesArray[2])! {
//                                    realDevices3.append(device)
//                                }
//                            } else {
//                                realReleaseDateDevicesArray = releaseDateDevicesArray[2].components(separatedBy: ",")
//                                if Int(realReleaseDateDevicesArray[0]) != nil  {
//                                    if Int(userDateSelected)! <= Int (realReleaseDateDevicesArray[0])! {
//                                        realDevices3.append(device)
//                                    }
//                                }
//                            }
//                        }
//                        
//                        if releaseValue == "Available" {
//                            announcedValue = device["announced"].stringValue
//                            realAnnouncedValue = announcedValue.components(separatedBy: ",")
//                            if Int(userDateSelected)! <= Int(realAnnouncedValue[0])! {
//                                realDevices3.append(device)
//                            }
//                        }
//                    }
//                }
//            case .failure(let error):
//                print (error)
//                }
//            }
        matchingDevices1.text = String(realDevices2.count) + " devices"
    }
    @IBAction func displaySizeSlider(_ sender: UISlider) {
//
        sliderLabel.text = String(Int(displaySizeSliderOutlet.value)) + " inches"
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
            sizeRange.textColor = .green
            sizeRange.text = "Valid Range"
        } else {
            sizeRange.textColor = .red
            sizeRange.text = "Invalid Range. No devices will be shown"
        }
    }
    
    @IBAction func displayMaxSizeSlider(_ sender: UISlider) {
        maxSizeSliderLabel.text = String (Int(displayMaxSizeSliderOutlet.value)) + " inches"
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
            sizeRange.textColor = .green
            sizeRange.text = "Valid Range"
        } else {
            sizeRange.textColor = .red
            sizeRange.text = "Invalid Range. No devices will be shown"
        }
    }
    @IBAction func continue2DisplaySize(_ sender: UIButton) {
        userSizeValue=String (Int(displaySizeSliderOutlet.value))
        userMaxSizeValue = String(Int(displayMaxSizeSliderOutlet.value))
        sliderLabel.text = (userSizeValue)
        maxSizeSliderLabel.text = (userMaxSizeValue)
        print ("\(userSizeValue) - \(userMaxSizeValue)")
    }

    override func viewDidLayoutSubviews() {
        
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
