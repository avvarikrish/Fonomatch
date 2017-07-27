//
//  Question3SensorsViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Question3DatesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var userDateSelected = String()
    var releaseDateDevicesArray: [String] = []
    var realReleaseDateDevicesArray: [String] = []
    var releaseValue = ""
    var announcedValue = ""
    var realAnnouncedValue: [String] =  []
    var realDevices3: [JSON] = []
    @IBOutlet weak var matchingDevices2: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBAction func continueToQ4Button(_ sender: UIButton) {
    }
    var dateSelected: [String] = ["2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print (realDevices3)
        matchingDevices2.text = String (realDevices3.count) + " devices"
        // Do any additional setup after loading the view.
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return dateSelected.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return dateSelected[row]
        
    }
    func selectRow(_ row: Int,
                   inComponent component: Int,
                   animated: Bool){
        self.view.endEditing(false)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.dateTextField.text = self.dateSelected[row]
        self.datePickerView.isHidden = true
        userDateSelected = dateSelected[row]
        print (userDateSelected)
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.dateTextField {
            self.datePickerView.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
    @IBAction func continue3Button(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToTalkTime", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTalkTime" {
            if let fourthViewController = segue.destination as? Question4TalkTimeViewController {
        for device in realDevices3 {
                                    releaseValue = device["status"].stringValue
                                    if releaseValue != "Discontinued" && releaseValue != "Rumored" && releaseValue != "Cancelled" && releaseValue != "Available" {
                                        releaseDateDevicesArray = releaseValue.components(separatedBy: " ")
                                        if Int (releaseDateDevicesArray[2]) != nil {
                                            if Int(userDateSelected)! <= Int (releaseDateDevicesArray[2])! {
                                                fourthViewController.realDevices4.append(device)
                                            }
                                        } else {
                                            realReleaseDateDevicesArray = releaseDateDevicesArray[2].components(separatedBy: ",")
                                            if Int(realReleaseDateDevicesArray[0]) != nil  {
                                                if Int(userDateSelected)! <= Int (realReleaseDateDevicesArray[0])! {
                                                    fourthViewController.realDevices4.append(device)
                                                }
                                            }
                                        }
                                    }
            
                                    if releaseValue == "Available" {
                                        announcedValue = device["announced"].stringValue
                                        realAnnouncedValue = announcedValue.components(separatedBy: ",")
                                        if Int(userDateSelected)! <= Int(realAnnouncedValue[0])! {
                                            fourthViewController.realDevices4.append(device)
                                        }
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

}
