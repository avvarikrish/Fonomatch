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
import Fabric
import Crashlytics

class Question2ViewController: UIViewController {
    var realDevices2: JSON = []
    var userSizeValue: String = ""
    var userMaxSizeValue = ""
    var sizeDevicesArray: [String] = []
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var view1Button: UIButton!
    @IBOutlet weak var displaySizeSliderOutlet: UISlider!
    @IBOutlet weak var maxSizeSliderLabel: UILabel!
    @IBOutlet weak var sizeRange: UILabel!
    @IBOutlet weak var displayMaxSizeSliderOutlet: UISlider!
    @IBOutlet weak var continue1Button: UIButton!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var matchingDevices1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view1Button.layer.cornerRadius=5
        continue1Button.layer.cornerRadius=5
        if realDevices2.count == 1 {
            matchingDevices1.text = "You match:  " + String (realDevices2.count) + " device"
        } else {
            matchingDevices1.text = "You match:  " + String (realDevices2.count) + " devices"
        }
        question2Label.text = "Indicate a size range for screen display."
    }
    @IBAction func displaySizeSlider(_ sender: UISlider) {
        //
        sliderLabel.text = String(Int(displaySizeSliderOutlet.value)) + " inches"
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
            sizeRange.textColor = .green
            sizeRange.text = "Valid Range"
        } else {
            sizeRange.textColor = UIColor(red:0.95, green:0.03, blue:0.02, alpha:1.0)
            sizeRange.text = "Invalid Range"
        }
    }
    
    @IBAction func displayMaxSizeSlider(_ sender: UISlider) {
        maxSizeSliderLabel.text = String (Int(displayMaxSizeSliderOutlet.value)) + " inches"
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
            sizeRange.textColor = .green
            sizeRange.text = "Valid Range"
        } else {
            sizeRange.textColor = UIColor(red:0.95, green:0.03, blue:0.02, alpha:1.0)
            sizeRange.text = "Invalid Range"
        }
    }
    @IBAction func continue2DisplaySize(_ sender: UIButton) {
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
            userSizeValue=String (Int(displaySizeSliderOutlet.value))
            userMaxSizeValue = String(Int(displayMaxSizeSliderOutlet.value))
            sliderLabel.text = (userSizeValue)
            maxSizeSliderLabel.text = (userMaxSizeValue)
            self.performSegue(withIdentifier: "segueToDates", sender: self)
        } else {
            var allarme = UIAlertView(title: "Error", message: "Please enter a valid range", delegate: self, cancelButtonTitle: "OK")
            allarme.show()
        }
    }
    @IBAction func viewDevices1(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToList", sender: self)
    }
    override func viewDidLayoutSubviews() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        matchingDevices1.text = "You match:   " + String(realDevices2.count) + " devices"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDates" {
            if let thirdViewController = segue.destination as? Question3DatesViewController {
                for device in realDevices2.arrayValue {
                    let sizeValue = device[]["size"].stringValue
                    sizeDevicesArray = sizeValue.components(separatedBy: " ")
                    if Double(sizeDevicesArray[0]) != nil {
                        if Double(userSizeValue)! <= Double(sizeDevicesArray[0])! && Double(userMaxSizeValue)! >= Double(sizeDevicesArray[0])! {
                            thirdViewController.realDevices3.append(device[])
                        }
                    }
                }
            }
        }
        if segue.identifier == "segueToList" {
            if let finalViewController = segue.destination as? TransitionViewController {
                for device in realDevices2.arrayValue {
                    finalViewController.realDevices5.append(device[])
                }
            }
        }
        
    }
    
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


