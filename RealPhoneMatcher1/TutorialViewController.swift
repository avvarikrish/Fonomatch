//
//  ViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/13/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class tutorialViewController: UIViewController {
    let tutorialQuestions = ["What phone size do you prefer?"]
    let tutorialAnswers = ["Greater than 5 inches", "Less than 5 inches"]
    var currentQuestion = 0
    var tutorialUserAnswer = 0
    @IBAction func tutorialAnswersAction(_ sender: AnyObject) {
        if ((sender).tag == 1) {
            
            print ("Large phone chosen")
        } else {
            print ("Small phone chosen ")
        }
    }
    @IBOutlet weak var tutorialQuestionLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        tutorialMatchingPhone()
    }
    func tutorialMatchingPhone() {
        tutorialQuestionLabel.text = tutorialQuestions [currentQuestion]
        var button: UIButton = UIButton()
        for i in 1...2 {
            button = view.viewWithTag(i) as! UIButton
            let x = 1
            if (x == i) {
                button.setTitle(tutorialAnswers[currentQuestion], for: .normal)
            } else {
                button.setTitle(tutorialAnswers[x], for: .normal)
            }
        }
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    //hello
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
