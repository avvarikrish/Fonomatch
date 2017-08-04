//
//  TransitionViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 8/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

    @IBOutlet weak var swipeRight: UIImageView!
    @IBOutlet weak var swipeLeft: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRight.loadGif(name: "croppedswiperight")
        swipeLeft.loadGif(name: "croppedswipeleft")
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
