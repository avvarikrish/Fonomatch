//
//  TransitionViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 8/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON

class TransitionViewController: UIViewController {
    var realDevices5 : [JSON] = []
    @IBOutlet weak var swipeRight: UIImageView!
    @IBOutlet weak var swipeLeft: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRight.loadGif(name: "croppedswiperight")
        swipeLeft.loadGif(name: "croppedswipeleft")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func continueButtonToList(_ sender: UIButton) {
        self.performSegue(withIdentifier: "realSegueToList", sender: self)
        print (realDevices5)
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
