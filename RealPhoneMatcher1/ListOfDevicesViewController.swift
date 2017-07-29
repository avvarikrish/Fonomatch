//
//  Question1SecondViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/17/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ListOfDevicesTableViewController : UITableViewController {
    var deviceLabel: String = ""
    var brandLabel: String = ""
    var statusLabel: String = ""
    var dimensionsLabel: String = ""
    var weightLabel = ""
    var resolutionLabel = ""
    var featuresLabel = ""
    var colorsLabel = ""
    var talkTimeLabel = ""
    var sizeLabel = ""
    var realDevices5: [JSON] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print (realDevices5.count)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realDevices5.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listOfDevicesTableViewCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.orange
        cell.textLabel?.text = realDevices5[indexPath.row]["DeviceName"].stringValue
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deviceLabel = realDevices5[indexPath.row]["DeviceName"].stringValue
        brandLabel = realDevices5[indexPath.row]["Brand"].stringValue
        statusLabel = realDevices5[indexPath.row]["status"].stringValue
        dimensionsLabel = realDevices5[indexPath.row]["dimensions"].stringValue
        weightLabel = realDevices5[indexPath.row]["weight"].stringValue
        resolutionLabel = realDevices5[indexPath.row]["resolution"].stringValue
        featuresLabel = realDevices5[indexPath.row]["features_c"].stringValue
        colorsLabel = realDevices5[indexPath.row]["colors"].stringValue
        talkTimeLabel = realDevices5[indexPath.row]["talk_time"].stringValue
        sizeLabel = realDevices5[indexPath.row]["size"].stringValue
        // Segue to the second view controller
        self.performSegue(withIdentifier: "segueToProperties", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "segueToProperties" {
            if let sixthViewController = segue.destination as? TestViewController {
                // set a variable in the second view controller with the data to pass
                 sixthViewController.deviceNameLabel = deviceLabel
                sixthViewController.brandNameLabel = brandLabel
                sixthViewController.statusNameLabel = statusLabel
                sixthViewController.dimensionsNameLabel = dimensionsLabel
                sixthViewController.weightNameLabel = weightLabel
                sixthViewController.resolutionNameLabel = resolutionLabel
                sixthViewController.featuresNameLabel = featuresLabel
                sixthViewController.colorsNameLabel = colorsLabel
                sixthViewController.talkTimeNameLabel = talkTimeLabel
                sixthViewController.sizeNameLabel = sizeLabel
            }
        }
    }
        //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
        //        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        //        let destination = TestViewController()
        //        navigationController?.pushViewController(destination, animated: true)
        //        let row = indexPath.row
        //
        //    }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
