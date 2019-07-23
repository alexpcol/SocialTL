//
//  ProfileViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded, ProfileViewable {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup(title: String, presenter: ProfilePresentable) {
        print(title)
    }
}
