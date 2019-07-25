//
//  HomeCoordinator.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    var user: User
    
    init(navigationController: UINavigationController, forUser user: User) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let homeTabBarController = HomeTabBarController()
        let presenter = HomeTabBarPresenter(withCoordinator: self, andUser: user)
        presenter.attach(view: homeTabBarController as HomeTabBarViewable)
        navigationController.present(homeTabBarController, animated: true)
    }
    
    func signOut() {
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true)
    }
}
