//
//  LoginViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded, LoginViewable {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setup(title: String, presenter: LoginPresentable) {
        print(title)
    }

}
