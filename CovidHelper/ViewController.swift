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
    @IBOutlet var userSubmitButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBAction func getUserNameField(_ sender: UITextField) {
        
//        nameField.text
        errorLabel.text=""
    }
    @IBAction func dobSelected(_ sender: UIDatePicker) {
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
    }
    
    @IBAction func infoSubmit(_ sender: UIButton) {
//        let userDOB = dobPicker.date
        let userName:String? = nameField.text
        if userName != "" && userName != nil{
            if  let arrayOfTabBarItems = tabBarController?.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
                tabBarItem.isEnabled = true
            }
            
        }else{
            errorLabel.text = "Please provide your name"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.text = ""
        dobPicker.datePickerMode = UIDatePicker.Mode.date
        dobPicker.maximumDate = Date()
        userSubmitButton.layer.cornerRadius = 7
        if  let arrayOfTabBarItems = tabBarController?.tabBar.items as AnyObject as? NSArray,let tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
            tabBarItem.isEnabled = false
        }
        
    }
    
}

