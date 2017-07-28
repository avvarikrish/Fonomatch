//
//  TestViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/26/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var realBrandLabel: UILabel!
    @IBOutlet weak var realStatusLabel: UILabel!
    @IBOutlet weak var realDimensionsLabel: UILabel!
    @IBOutlet weak var realWeightLabel: UILabel!
    @IBOutlet weak var realResolutionLabel: UILabel!
    @IBOutlet weak var realFeaturesLabel: UILabel!
    @IBOutlet weak var realColorsLabel: UILabel!
    @IBOutlet weak var realTalkTimeLabel: UILabel!
    @IBOutlet weak var realSizeLabel: UILabel!
    var deviceNameLabel  = ""
    var brandNameLabel = ""
    var statusNameLabel = ""
    var dimensionsNameLabel = ""
    var weightNameLabel = ""
    var resolutionNameLabel = ""
    var featuresNameLabel = ""
    var colorsNameLabel = ""
    var talkTimeNameLabel = ""
    var sizeNameLabel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = deviceNameLabel + ":"
        realBrandLabel.text = "Brand: " + brandNameLabel
        realStatusLabel.text = "Status: " + statusNameLabel
        realDimensionsLabel.text = "Dimensions: " + dimensionsNameLabel
        realWeightLabel.text = "Weight: " + weightNameLabel
        realResolutionLabel.text = "Resolution: " + resolutionNameLabel
        realFeaturesLabel.text = "Features: " + featuresNameLabel
        realColorsLabel.text = "Colors: " + colorsNameLabel
        realTalkTimeLabel.text = "Talk Time: " + talkTimeNameLabel
        realSizeLabel.text = "Size: " + sizeNameLabel
        // Do any additional setup after loading the view.
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
