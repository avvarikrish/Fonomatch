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
import MGSwipeTableCell
import Fabric
import Crashlytics

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
    var realDevices6: [JSON] = []
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var swipeToView: UISwipeGestureRecognizer!
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let reuseIdentifier = "listOfDevicesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MGSwipeTableCell
        cell.textLabel?.textColor = UIColor.orange
        cell.textLabel!.text = realDevices6[indexPath.row]["DeviceName"].stringValue
        cell.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named:"amazonView"), backgroundColor: .black) { (sender: MGSwipeTableCell!) -> Bool in
            let amazonDevice = self.realDevices6[indexPath.row]["DeviceName"].stringValue
            var amazonDeviceArray = amazonDevice.components(separatedBy: " ")
            var realAmazonDeviceArray = ""
            for x in 0...amazonDeviceArray.count-1 {
                realAmazonDeviceArray += amazonDeviceArray[x] + "+"
            }
            UIApplication.shared.openURL(NSURL(string: "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=\(realAmazonDeviceArray)")! as URL)
            return true}]
        if( indexPath.row % 2 == 0){
            //cell.backgroundColor=UIColorFromHex(rgbValue: 0x3B728C);
            cell.backgroundColor=UIColorFromHex(rgbValue: 0x36687F)
        }
        else{
            cell.backgroundColor = UIColorFromHex(rgbValue: 0x36687F)
        }
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realDevices6.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deviceLabel = realDevices6[indexPath.row]["DeviceName"].stringValue
        brandLabel = realDevices6[indexPath.row]["Brand"].stringValue
        statusLabel = realDevices6[indexPath.row]["status"].stringValue
        dimensionsLabel = realDevices6[indexPath.row]["dimensions"].stringValue
        weightLabel = realDevices6[indexPath.row]["weight"].stringValue
        resolutionLabel = realDevices6[indexPath.row]["resolution"].stringValue
        featuresLabel = realDevices6[indexPath.row]["features_c"].stringValue
        colorsLabel = realDevices6[indexPath.row]["colors"].stringValue
        talkTimeLabel = realDevices6[indexPath.row]["talk_time"].stringValue
        sizeLabel = realDevices6[indexPath.row]["size"].stringValue
        self.performSegue(withIdentifier: "segueToProperties", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToProperties" {
            if let sixthViewController = segue.destination as? TestViewController {
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
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            realDevices6.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.none
        
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return false
        
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
