//
//  ViewController.swift
//  RestAPI
//
//  Created by mac on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        ApiManger.shared.getUser { users in
            print(users.userID)
        }
    }
}

