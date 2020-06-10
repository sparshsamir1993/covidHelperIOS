//
//  QuestionnaireViewController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-09.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//


import UIKit
class QuestionnaireViewController: UIViewController {
    @IBOutlet var answerOne: UISwitch!
    @IBOutlet var answerTwo: UISwitch!
    @IBOutlet var answerThree: UISwitch!
    @IBOutlet var answerFour: UISwitch!
    @IBOutlet var qSubmit: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    @IBAction func questionsSubmitted(_ sender: UIButton) {
        if answerOne.isOn {
            errorLabel.text = "Call 911"
        }
        if answerTwo.isOn{
            errorLabel.text = "Call 811"
        }
        if answerThree.isOn{
            errorLabel.text = "Get tested immediately"
        }
        if answerFour.isOn{
            errorLabel.text = "Get tested immediately"
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        qSubmit.layer.cornerRadius = 7
    }

    
}
