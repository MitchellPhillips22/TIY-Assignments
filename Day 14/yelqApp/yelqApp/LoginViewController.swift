//
//  LoginViewController.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

     var hasLoggedIn = false
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    @IBAction func logInButton(sender: UIButton) {
     
        if usernameText.text == "Mitchell" && passwordText.text == "ILoveYelq" {
            performSegueWithIdentifier("loginSegue", sender: self)
            hasLoggedIn = true
        } else {
            incorrectLabel.text = ("Login info incorrect")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

