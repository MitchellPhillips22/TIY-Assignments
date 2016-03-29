//
//  LoginViewController.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var userArray = [User]()
    
    var userRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/users")

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(sender: UIButton) {
        
        userRef.authUser(usernameTextField.text, password: passwordTextField.text, withCompletionBlock: { (error, auth) -> Void in
            
            print("user authorized")
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    func seedTimeSlot() {
        
        let t = TimeSlot()
        
        t.name = "9:30"
        t.startDate = NSDate()
        t.endDate = NSDate()
        t.user = User()
        
        t.saveTimeslot()
        
    }
    
       
    func seedEvent() {
        
        let e = Event()
        
        e.name = ""
        e.genre = ""
        e.startDate = NSDate()
        e.endDate = NSDate()
        
        e.saveEvent()
        
    }
        
}

