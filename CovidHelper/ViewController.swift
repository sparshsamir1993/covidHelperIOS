//
//  ViewController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-09.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dobPicker: UIDatePicker!
    @IBAction func getUserNameField(_ sender: UITextField) {
        
//        nameField.text
    }
    @IBAction func dobSelected(_ sender: UIDatePicker) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dobPicker.datePickerMode = UIDatePicker.Mode.date
    }
    
}

