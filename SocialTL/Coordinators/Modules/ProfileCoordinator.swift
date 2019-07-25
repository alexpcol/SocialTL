//
//  LoginCoordinator.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit
import Firebase

class ProfileCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: HomeCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK:- MVP Methods
    func start() {
        let profileViewController = ProfileViewController.instantiate(fromStoryboard: "Profile")
        let presenter = ProfilePresenter(withCoordinator: self)
        presenter.attach(view: profileViewController as ProfileViewable)
        navigationController.pushViewController(profileViewController, animated: true)
    }
    
    func signOut() {
        parentCoordinator?.signOut()
    }
    
}
