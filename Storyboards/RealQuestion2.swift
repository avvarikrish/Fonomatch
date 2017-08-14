//
//  RealQuestion2.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 8/11/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON

class RealQuestion2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var devicesArray: [String] = []
    var realDevicesArray: String = ""
    @IBOutlet weak var question2TextBox: UITextField!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var question2DropDown: UIPickerView!
    var valueSelected = String()
    var realDevices0: JSON = []
    @IBOutlet weak var matchingDevices: UILabel!
    var devices: [String] = ["iPad", "iPhone", "Watch"]
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius=5
        viewButton.layer.cornerRadius=5
        self.question2DropDown.delegate = self
        self.question2DropDown.dataSource = self
        self.question2DropDown.isHidden = false
        if realDevices0.count == 1 {
            matchingDevices.text = "You match:  " + String (realDevices0.count) + " device"
        } else {
            matchingDevices.text = "You match:  " + String (realDevices0.count) + " devices"
        }
        // Do any additional setup after loading the view.
        self.isEditing = false
        self.question2TextBox.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func viewDevices(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToList", sender: self)
    }
    
    @IBAction func continue2Sizes(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToSize", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSize" {
            if let secondViewController = segue.destination as? Question2ViewController {
                for device in realDevices0.arrayValue {
                    let deviceValue = device[]["DeviceName"].stringValue
                    devicesArray = deviceValue.components(separatedBy: " ")
                    realDevicesArray = devicesArray[1]
                    if valueSelected == "" {
                        valueSelected = "iPad"
                    }
                    if realDevicesArray == valueSelected {
                        secondViewController.realDevices2.append (device[])
                    }
                }
            }
        }
        if segue.identifier == "segueToList" {
            if let finalViewController = segue.destination as? TransitionViewController {
                for device in realDevices0.arrayValue {
                    finalViewController.realDevices5.append(device[])
                }
            }
        }
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return devices.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return devices[row]
        
    }
    func selectRow(_ row: Int,
                   inComponent component: Int,
                   animated: Bool){
        self.view.endEditing(false)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.question2TextBox.text = self.devices[row]
        self.question2DropDown.isHidden = false
        valueSelected = devices[row]
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.question2TextBox {
            self.question2DropDown.isHidden = false
            //if you dont want the users to se the keyboard type:
            textField.endEditing(false)
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: devices[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
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
