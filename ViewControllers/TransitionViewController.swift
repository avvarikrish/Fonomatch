//
//  TransitionViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 8/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Fabric
import Crashlytics

class TransitionViewController: UIViewController {
    var realDevices5 : [JSON] = []
    @IBOutlet weak var swipeRight: UIImageView!
    @IBOutlet weak var matchingDevices5: UILabel!
    @IBOutlet weak var swipeLeft: UIImageView!
    @IBOutlet weak var continue4Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continue4Button.layer.cornerRadius=5
        swipeRight.loadGif(name: "croppedswiperight")
        swipeLeft.loadGif(name: "croppedswipeleft")
        if realDevices5.count == 1 {
            matchingDevices5.text = "You match:   " + String (realDevices5.count) + " device in total"
        } else {
            matchingDevices5.text = "You match:   " + String (realDevices5.count) + " devices in total"
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func continueButtonToList(_ sender: UIButton) {
        self.performSegue(withIdentifier: "realSegueToList", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "realSegueToList" {
            if let finalViewController = segue.destination as? ListOfDevicesTableViewController {
                for device in realDevices5 {
                    finalViewController.realDevices6.append(device)
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
