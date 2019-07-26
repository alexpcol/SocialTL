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
    private var addButtonAction:(() -> Void)?
    
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
    
    func showAddButton(action: @escaping () -> Void) {
        addButtonAction = action
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.rightBarButtonItems = [addButtonItem]
    }
    
    //MARK:- Actions
    @objc private func didTapAddButton() {
        addButtonAction?()
    }

}
