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
import Fabric
import Crashlytics

class Question1ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var continue0Button: UIButton!
    @IBOutlet weak var question1TextView: UITextView!
    var valueSelected = String()
    var realDevices: JSON = []
    @IBOutlet weak var question1TextBox: UITextField!
    @IBOutlet weak var question1DropDown: UIPickerView!
    var list: [String] = ["Apple"]
    override func viewDidLoad() {
        super.viewDidLoad()
        continue0Button.layer.cornerRadius=5
        question1TextView.text = "Sample Question Page"
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
        let apiToContact = "https://fonoapi.freshpixl.com/v1/getlatest?brand=apple&token=fa3b068e2b9e81df7efa3295e02220ce66bec14716e21839"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.realDevices = json[]
                    self.performSegue(withIdentifier: "segueToDevice", sender: self)
                }
            case .failure (let error):
                var allarme = UIAlertView(title: "Error", message: "Something went wrong with the internet. Please try again later.", delegate: self, cancelButtonTitle: "OK")
                allarme.show()
                print (error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDevice" {
            if let secondViewController = segue.destination as? RealQuestion2 {
                secondViewController.realDevices0 = self.realDevices
            }
        }
    }
}


