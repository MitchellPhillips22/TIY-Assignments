//
//  RegisterViewController.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/25/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var userRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/users")
    
    var userArray = [User]()


    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        observeUser()
        seedUser()
    }
    
    @IBAction func registerButton(sender: UIButton) {
        
        self.userRef.createUser(usernameTextField.text, password: passwordTextField.text) { (error: NSError!) in
            
            if error == nil {
                
                self.userRef.authUser(self.usernameTextField.text, password: self.passwordTextField.text, withCompletionBlock: { (error, auth) in
                    
                })
            }
            
            self.seedUser()
        }
        
    }
    
    func seedUser() {
        
        let u = User()
        
        u.email = usernameTextField.text!
        u.password = passwordTextField.text!
        u.created = NSDate()
        
        u.saveUser()
        
        print(u.email)
        
    }
    
    func observeUser() {
        
        self.userRef.observeEventType(.Value, withBlock: {
            
            (snapshot) -> () in
            
            self.userArray.removeAll()
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    if let dict = snap.value as? [String: AnyObject] {
                        
                        let key = snap.key
                        
                        let user = User(key: key, dict: dict)
                        
                        self.userArray.insert(user, atIndex: 0)
                    }
                }
            }
            
        })
    }


}
