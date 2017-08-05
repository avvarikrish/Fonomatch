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

class Question2ViewController: UIViewController {
    var realDevices2: JSON = []
    var userSizeValue: String = ""
    var userMaxSizeValue = ""
    var sizeDevicesArray: [String] = []
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var displaySizeSliderOutlet: UISlider!
    @IBOutlet weak var maxSizeSliderLabel: UILabel!
    @IBOutlet weak var sizeRange: UILabel!
    @IBOutlet weak var displayMaxSizeSliderOutlet: UISlider!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var matchingDevices1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchingDevices1.text = "You match:   " + String(realDevices2.count) + " devices"
        question2Label.text = "Indicate a size range for screen display."
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
        if (Int(displaySizeSliderOutlet.value)) <= (Int(displayMaxSizeSliderOutlet.value)) {
        userSizeValue=String (Int(displaySizeSliderOutlet.value))
        userMaxSizeValue = String(Int(displayMaxSizeSliderOutlet.value))
        sliderLabel.text = (userSizeValue)
        maxSizeSliderLabel.text = (userMaxSizeValue)
        print ("\(userSizeValue) - \(userMaxSizeValue)")
        self.performSegue(withIdentifier: "segueToDates", sender: self)
        } else {
            let popOverVC = UIStoryboard(name: "Question2DisplaySize", bundle: nil).instantiateViewController(withIdentifier: "SizePopUp") as! PopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
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


