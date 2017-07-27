//
//  Question1ViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/16/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
//var releaseValue = ""
//var announcedValue = ""
//var realAnnouncedValue: [String] =  []
//var talkTimeValue = ""
//var realDevices2: [JSON] = []
//var realDevices3: [JSON] = []
//var realDevices4: [JSON] = []
//var sizeDevicesArray: [String] = []
//var releaseDateDevicesArray: [String] = []
//var realReleaseDateDevicesArray: [String] = []
//var talkTimeDevicesArray: [String] = []
//var realTalkTimeDevicesArray: [String] = []
var realDevices1: JSON = []
var valueSelected = String()
class Question1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var devices: Devices!
    @IBOutlet weak var question1TextBox: UITextField!
    @IBOutlet weak var question1DropDown: UIPickerView!
    @IBAction func continue1Button(_ sender: UIButton) {
        
    }

    var list: [String] = ["Acer", "Alcatel", "Allview", "Apple", "Archos", "Asus", "Blackberry", "Blu", "BQ", "Celkon", "Coolpad", "Dell", "Energizer", "Garmin", "Google", "HP", "HTC", "Huawei", "I-Mobile", "IceMobile", "Intex", "Jolla", "Karbonn", "Kyocera", "Lava", "Leeco", "Lenovo", "LG", "Maxwest", "Meizu", "Micromax", "Microsoft", "Modu", "Motorola", "Nec", "NIU", "Nokia", "Nvidia", "Oneplus", "Oppo", "Orange", "Palm", "Panasonic", "Pantech", "Parla", "Plum", "Posh", "Prestigio", "Qmobile", "Samsung", "Sharp", "Sonim", "Sony", "Spice", "Toshiba", "Unnecto", "Vertu", "Vivo", "Vodafone", "Wiko", "Xiaomi", "Xolo", "Yezz", "Yota", "Yu", "ZTE"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
//                let apiToContact = "https://fonoapi.freshpixl.com/v1/getlatest?brand=" + valueSelected + "&token=fa3b068e2b9e81df7efa3295e02220ce66bec14716e21839"
//                Alamofire.request(apiToContact).validate().responseJSON() { response in
//                    switch response.result {
//                    case .success:
//                        if let value = response.result.value {
//                            let json = JSON(value)
//                            let realDevices: JSON = json[]
//                            self.devices = Devices (json: json [])
//                            for device in realDevices.arrayValue {
//                                let sizeValue = device["size"].stringValue
//                                sizeDevicesArray = sizeValue.components(separatedBy: " ")
//                                if Double(sizeDevicesArray[0]) != nil {
//                                    if Double(userSizeValue)! <= Double(sizeDevicesArray[0])! && Double(userMaxSizeValue)! >= Double(sizeDevicesArray[0])! {
//                                        realDevices2.append(device[])
//                                    }
//                                }
//                            }
//                            for device in realDevices2 {
//                                                        releaseValue = device["status"].stringValue
//                                                        if releaseValue != "Discontinued" && releaseValue != "Rumored" && releaseValue != "Cancelled" && releaseValue != "Available" {
//                                                            releaseDateDevicesArray = releaseValue.components(separatedBy: " ")
//                                                            if Int (releaseDateDevicesArray[2]) != nil {
//                                                                if Int(userDateSelected)! <= Int (releaseDateDevicesArray[2])! {
//                                                                    realDevices3.append(device)
//                                                                }
//                                                            } else {
//                                                                realReleaseDateDevicesArray = releaseDateDevicesArray[2].components(separatedBy: ",")
//                                                                if Int(realReleaseDateDevicesArray[0]) != nil  {
//                                                                    if Int(userDateSelected)! <= Int (realReleaseDateDevicesArray[0])! {
//                                                                        realDevices3.append(device)
//                                                                    }
//                                                                }
//                                                            }
//                                                        }
//                                                        
//                                                        if releaseValue == "Available" {
//                                                            announcedValue = device["announced"].stringValue
//                                                            realAnnouncedValue = announcedValue.components(separatedBy: ",")
//                                                            if Int(userDateSelected)! <= Int(realAnnouncedValue[0])! {
//                                                                realDevices3.append(device)
//                                                            }
//                                                        }
//                                                    }
//                        }
//                    case .failure(let error):
//                        print (error)
//                        }
//                    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
        
    }
    func selectRow(_ row: Int,
                   inComponent component: Int,
                   animated: Bool){
        self.view.endEditing(false)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.question1TextBox.text = self.list[row]
        self.question1DropDown.isHidden = true
        valueSelected = list[row]
        print (valueSelected)
    
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName:UIColor.white])
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.question1TextBox {
            self.question1DropDown.isHidden = false
            //if you dont want the users to se the keyboard type:
            
//            textField.endEditing(true)
        }
    }
    
    
    
}


