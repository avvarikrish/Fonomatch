//
//  ViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/13/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import Crashlytics

class tutorialViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    //hello
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
