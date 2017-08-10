//
//  ViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/13/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

class tutorialViewController: UIViewController {
    
    @IBOutlet weak var continue01Button: UIButton!
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continue01Button.layer.cornerRadius=5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
