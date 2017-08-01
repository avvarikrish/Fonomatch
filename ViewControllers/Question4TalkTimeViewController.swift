//
//  Question4TalkTimeViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/24/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class Question4TalkTimeViewController: UIViewController {
    var userTalkTimeValue = ""
    var talkTimeValue = ""
    var talkTimeDevicesArray: [String] = []
    var realTalkTimeDevicesArray: [String] = []
    var realDevices4: [JSON] = []
    @IBOutlet weak var talkTimeSlider: UISlider!
    @IBOutlet weak var talkTimeLabel: UILabel!
    @IBOutlet weak var matchingPhones3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchingPhones3.text = String(realDevices4.count) + " devices"
        // Do any additional setup after loading the view.
    }

    @IBAction func talkTimeActionSlider(_ sender: UISlider) {
        talkTimeLabel.text = String(Int(talkTimeSlider.value)) + " hours"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continue4Button(_ sender: UIButton) {
        userTalkTimeValue = String(Int(talkTimeSlider.value))
        self.performSegue(withIdentifier: "segueToList", sender: self)
    }

    @IBAction func view3AllDevices(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToRealList", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToList" {
            if let fifthViewController = segue.destination as? ListOfDevicesTableViewController {
                for device in realDevices4 {
                    talkTimeValue = device["talk_time"].stringValue
                    talkTimeDevicesArray = talkTimeValue.components(separatedBy: " ")
                    
                    if talkTimeDevicesArray[0] == "Up" {
                        if Int(userTalkTimeValue)! <= Int(talkTimeDevicesArray[2])! {
                            fifthViewController.realDevices5.append(device)
                        }
                    } else {
                        fifthViewController.realDevices5.append(device)
                    }
                }
            }
        }
        if segue.identifier == "segueToRealList" {
            if let finalViewController = segue.destination as? ListOfDevicesTableViewController {
                for device in realDevices4 {
                    finalViewController.realDevices5.append(device)
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

}
