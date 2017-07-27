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
var releaseValue = ""
var announcedValue = ""
var realAnnouncedValue: [String] =  []
var talkTimeValue = ""
var realDevices2: [JSON] = []
var realDevices3: [JSON] = []
var realDevices4: [JSON] = []
var sizeDevicesArray: [String] = []
var releaseDateDevicesArray: [String] = []
var realReleaseDateDevicesArray: [String] = []
var talkTimeDevicesArray: [String] = []
var realTalkTimeDevicesArray: [String] = []
class ListOfDevicesTableViewController : UITableViewController {
    var devices: Devices!
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiToContact = "https://fonoapi.freshpixl.com/v1/getlatest?brand=" + valueSelected + "&token=fa3b068e2b9e81df7efa3295e02220ce66bec14716e21839"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let realDevices: JSON = json[]
                    self.devices = Devices (json: json [])
                    print (json)
                    //                    self.DeviceNameLabel.text = self.devices.deviceName
                    //                    for device in json.arrayValue {
                    //                        device["DeviceName"]
                    //                    }
                    //                    print (realDevices.count)
                    for device in realDevices.arrayValue {
                        let sizeValue = device["size"].stringValue
                        sizeDevicesArray = sizeValue.components(separatedBy: " ")
                        if Double(sizeDevicesArray[0]) != nil {
                            if Double(userSizeValue)! <= Double(sizeDevicesArray[0])! && Double(userMaxSizeValue)! >= Double(sizeDevicesArray[0])! {
                                realDevices2.append(device[])
                            }
                        }
                    }
                    for device in realDevices2 {
                        releaseValue = device["status"].stringValue
                        if releaseValue != "Discontinued" && releaseValue != "Rumored" && releaseValue != "Cancelled" && releaseValue != "Available" {
                            releaseDateDevicesArray = releaseValue.components(separatedBy: " ")
                            if Int (releaseDateDevicesArray[2]) != nil {
                                if Int(userDateSelected)! <= Int (releaseDateDevicesArray[2])! {
                                    realDevices3.append(device)
                                }
                            } else {
                                realReleaseDateDevicesArray = releaseDateDevicesArray[2].components(separatedBy: ",")
                                if Int(realReleaseDateDevicesArray[0]) != nil  {
                                    if Int(userDateSelected)! <= Int (realReleaseDateDevicesArray[0])! {
                                        realDevices3.append(device)
                                    }
                                }
                            }
                        }
                        
                        if releaseValue == "Available" {
                            announcedValue = device["announced"].stringValue
                            realAnnouncedValue = announcedValue.components(separatedBy: ",")
                            if Int(userDateSelected)! <= Int(realAnnouncedValue[0])! {
                                realDevices3.append(device)
                            }
                        }
                    }
                    for device in realDevices3 {
                        talkTimeValue = device["talk_time"].stringValue
                        
                        talkTimeDevicesArray = talkTimeValue.components(separatedBy: " ")
                        //                        print (device["DeviceName"])
                        //                        print (talkTimeDevicesArray)
                        //                        print (talkTimeValue)
                        if talkTimeDevicesArray[0] == "Up" {
                            if Int(userTalkTimeValue)! <= Int(talkTimeDevicesArray[2])! {
                                realDevices4.append(device)
                            }
                        } else {
                            realDevices4.append (device)
                        }
                    }
                    self.tableView.reloadData()
//                    print (realDevices4)
                }
            case .failure (let error):
                print (error)
            }
        }
        // Do any additional setup after loading the view.
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueToProperties"{
//            if let nextViewController = segue.destination as? TestViewController{
//                print ("Selected")
//                
//            }
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realDevices4.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listOfDevicesTableViewCell", for: indexPath)
        cell.textLabel?.text = realDevices4[indexPath.row]["DeviceName"].stringValue
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: "segueToProperties", sender: self)
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! TestViewController
        
        // set a variable in the second view controller with the data to pass
        secondViewController.receivedData = "hello"
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
