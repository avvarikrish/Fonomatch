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
    var receivedData = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print (receivedData)
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
