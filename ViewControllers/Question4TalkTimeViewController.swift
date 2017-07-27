//
//  Question4TalkTimeViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/24/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
var userTalkTimeValue = ""
class Question4TalkTimeViewController: UIViewController {

    @IBOutlet weak var talkTimeSlider: UISlider!
    @IBOutlet weak var talkTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func talkTimeActionSlider(_ sender: UISlider) {
        talkTimeLabel.text = String(Int(talkTimeSlider.value)) + " hours"
    }
    @IBAction func continue4TalkTime(_ sender: UIButton) {
        userTalkTimeValue = String(Int(talkTimeSlider.value))
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
