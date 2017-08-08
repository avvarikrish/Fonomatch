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


class Question1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var question1TextView: UITextView!
    var valueSelected = String()
    var realDevices: JSON = []
    @IBOutlet weak var question1TextBox: UITextField!
    @IBOutlet weak var question1DropDown: UIPickerView!
    var list: [String] = ["Acer", "Alcatel", "Allview", "Apple", "Archos", "Asus", "Blackberry", "Blu", "BQ", "Celkon", "Coolpad", "Dell", "Energizer", "Garmin", "Google", "HP", "HTC", "Huawei", "I-Mobile", "IceMobile", "Intex", "Jolla", "Karbonn", "Kyocera", "Lava", "Leeco", "Lenovo", "LG", "Maxwest", "Meizu", "Micromax", "Microsoft", "Modu", "Motorola", "Nec", "NIU", "Nokia", "Nvidia", "Oneplus", "Oppo", "Orange", "Palm", "Panasonic", "Pantech", "Parla", "Plum", "Posh", "Prestigio", "Qmobile", "Samsung", "Sharp", "Sonim", "Sony", "Spice", "Toshiba", "Unnecto", "Vertu", "Vivo", "Vodafone", "Wiko", "Xiaomi", "Xolo", "Yezz", "Yota", "Yu", "ZTE"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.question1DropDown.isHidden = true
        question1TextView.text = "Select a brand"
        question1TextView.isUserInteractionEnabled = false
        self.isEditing = false
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
        self.question1DropDown.isHidden = false
        valueSelected = list[row]
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.question1TextBox {
            self.question1DropDown.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: list[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
    
    @IBAction func continue1Button(_ sender: UIButton) {
        let apiToContact = "https://fonoapi.freshpixl.com/v1/getlatest?brand=" + valueSelected + "&token=fa3b068e2b9e81df7efa3295e02220ce66bec14716e21839"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.realDevices = json[]
                     self.performSegue(withIdentifier: "segueToSize", sender: self)
                }
            case .failure (let error):
                print (error)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSize" {
            if let secondViewController = segue.destination as? Question2ViewController {
            secondViewController.realDevices2 = self.realDevices
        }
        }
    }
}


