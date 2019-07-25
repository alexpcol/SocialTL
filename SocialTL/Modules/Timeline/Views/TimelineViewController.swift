//
//  TimelineViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, Storyboarded, TimelineViewable {
    private var presenter: TimelinePresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setup(title: String, presenter: TimelinePresentable) {
        self.presenter = presenter
    }
    
    func setSection(icon: String, title: String) {
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
    }
    
    //MARK:- Actions
    @IBAction func addPostTapped(_ sender: UIButton) {
        presenter.addPost()
    }

}
