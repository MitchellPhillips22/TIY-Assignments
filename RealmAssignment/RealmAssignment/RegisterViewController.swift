//
//  RegisterViewController.swift
//  RealmAssignment
//
//  Created by Mitchell Phillips on 3/23/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerUsername: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func addUser() {
    
        let currentUser = User()
        currentUser.username = registerUsername.text!
        currentUser.password = registerPassword.text!
        currentUser.createdAt = NSDate()
        
        print(currentUser.password)
        print(currentUser.username)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(currentUser)
        }
    }
    
    
}
