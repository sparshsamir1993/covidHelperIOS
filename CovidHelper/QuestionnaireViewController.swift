//
//  QuestionnaireViewController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-09.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//


import UIKit
class QuestionnaireViewController: UIViewController {
    @IBOutlet var qOne: UILabel!
    @IBOutlet var qTwo: UILabel!
    @IBOutlet var qThree: UILabel!
    @IBOutlet var qFour: UILabel!
    @IBOutlet var answerOne: UISwitch!
    @IBOutlet var answerTwo: UISwitch!
    @IBOutlet var answerThree: UISwitch!
    @IBOutlet var answerFour: UISwitch!
    @IBOutlet var qSubmit: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    @IBAction func questionsSubmitted(_ sender: UIButton) {// function that runs when submit button is clicked
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
        if !answerOne.isOn, !answerTwo.isOn, !answerThree.isOn, !answerFour.isOn {
            errorLabel.text = "Please stay at home"
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        qSubmit.layer.cornerRadius = 7
    }

    
}
