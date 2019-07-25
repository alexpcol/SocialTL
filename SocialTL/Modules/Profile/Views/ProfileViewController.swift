//
//  ProfileViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded, ProfileViewable {
    private var presenter: ProfilePresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup(title: String, presenter: ProfilePresentable) {
        print(title)
        self.presenter = presenter
    }
    
    func setSection(icon: String, title: String) {
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
    }
    
    //    MARK:- Actions
    @IBAction func signoutTapped(_ sender: UIButton) {
        presenter.signout()
    }
}
