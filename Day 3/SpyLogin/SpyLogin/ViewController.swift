//
//  ViewController.swift
//  SpyLogin
//
//  Created by Mitchell Phillips on 2/3/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var authButton: UIButton!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
           if textField == nameTextField {
            lastNameTextField.becomeFirstResponder()
        }
        if textField == lastNameTextField {
            lastNameTextField.resignFirstResponder()
        }
        return true
    }
    @IBAction func authenticate(sender: UIButton) {
        if nameTextField.text == "Mitchell" && lastNameTextField.text == "Phillips" {
            self.view.backgroundColor = UIColor.greenColor()
            greetingLabel.text = ("Good Evening, Agent \(lastNameTextField.text!)")
        } else {
            greetingLabel.text = ("ACCESS DENIED")
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
}

