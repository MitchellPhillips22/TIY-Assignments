//
//  DetailViewController.swift
//  FriendFinder
//
//  Created by Mitchell Phillips on 2/24/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailFriend = Friends()
    
    @IBOutlet weak var loginDetailLabel: UILabel!
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginDetailLabel.text = detailFriend.login
        self.nameDetailLabel.text = detailFriend.name
        self.emailLabel.text = detailFriend.email
       
    }

}
