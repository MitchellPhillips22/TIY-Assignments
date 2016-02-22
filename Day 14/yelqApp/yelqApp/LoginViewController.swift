//
//  LoginViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    @IBAction func logInButton(sender: UIButton) {
        
        if usernameText.text == "Mitchell" && passwordText.text == "ILoveYelq" {
            performSegueWithIdentifier("loginSegue", sender: self)
        } else {
            incorrectLabel.text = ("Login info incorrect")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if nameTextField.text == "Mitchell" && lastNameTextField.text == "Phillips" {
//            self.view.backgroundColor = UIColor.greenColor()
//            greetingLabel.text = ("Good Evening, Agent \(lastNameTextField.text!)")
//        } else {
//            greetingLabel.text = ("ACCESS DENIED")
//            self.view.backgroundColor = UIColor.redColor()
//        }
//    }

    }

}

