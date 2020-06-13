//
//  ViewController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-09.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var appHeading: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dobPicker: UIDatePicker!
    @IBOutlet var userSubmitButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
     let nameError = "Please enter full name, to answer questions"
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder()
    }
    
    @IBAction func infoSubmit(_ sender: UIButton) {
//        function that runs when submit button is clicked
        
        let userName:String? = nameField.text
        if userName != "" && userName != nil{
            if  let arrayOfTabBarItems = tabBarController?.tabBar.items as AnyObject as?
                NSArray,let tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem { // casting tabbar items as AnyObject first and then as NSArray.
                                                                                //Getting the tabbar item from that array and enabling it, if user
                                                                                // provided user name
                                                                                    
                tabBarItem.isEnabled = true
            }
            self.makeToast("Open questions tab")
            
        }else{
            errorLabel.text = nameError
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.text = ""
        dobPicker.datePickerMode = UIDatePicker.Mode.date
        dobPicker.maximumDate = Date()
        self.makeToast("Hi sparsh")
        nameField.delegate = self
        userSubmitButton.isEnabled = false
        userSubmitButton.alpha = 0.4
        errorLabel.text = nameError
        userSubmitButton.layer.cornerRadius = 7
        if  let arrayOfTabBarItems = tabBarController?.tabBar.items as AnyObject as?
            NSArray,let tabBarItem = arrayOfTabBarItems[1] as? UITabBarItem {
            tabBarItem.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) ->Bool {
        if let size = nameField.text?.split(separator: " ").count, size > 1 { // delegate used to see if the user has entered the full name (anything more than 2 words)
            userSubmitButton.isEnabled = true
            userSubmitButton.alpha = 1
            errorLabel.text = ""
            
        }else if let size = nameField.text?.split(separator: " ").count, size <= 1{
            userSubmitButton.isEnabled = false
            userSubmitButton.alpha = 0.4
            errorLabel.text = nameError
            
        }
        return true
        
    }
    
}

