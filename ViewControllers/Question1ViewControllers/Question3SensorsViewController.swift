//
//  Question3SensorsViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

var userDateSelected = String()
class Question3DatesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var matchingDevices2: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBAction func continueToQ4Button(_ sender: UIButton) {
    }
    var dateSelected: [String] = ["2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchingDevices2.text = String (realDevices2.count)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
