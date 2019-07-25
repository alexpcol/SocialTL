//
//  LoginCoordinator.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit
import Firebase

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private var api: API
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        api = API()
    }
    
    //MARK:- MVP Methods
    func start() {
//        api.signOut { (result) in
//            switch result {
//            case .success( _):
//                print("haha")
//            case .failure(let e):
//                print(e)
//            }
//        }
        let loadingViewController = LoadingViewController.instantiate(fromStoryboard: "Main")
        let presenter = LoadingPresenter(withCoordinator: self)
        presenter.attach(view: loadingViewController as LoadingViewable)
        navigationController.pushViewController(loadingViewController, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
        if childCoordinators.isEmpty {
            navigationController.popViewController(animated: false)
        }
    }
    
    func routeHome(for user: User) {
        let homeChildCoordinator = HomeCoordinator(navigationController: navigationController, forUser: user)
        homeChildCoordinator.parentCoordinator = self
        childCoordinators.append(homeChildCoordinator)
        homeChildCoordinator.start()
    }
    
    func routeLogin() {
        let loginChildCoordinator = LoginCoordinator(navigationController: navigationController)
        loginChildCoordinator.parentCoordinator = self
        childCoordinators.append(loginChildCoordinator)
        loginChildCoordinator.start()
    }
    
    func signUp() {
        
    }
    
    func signOut() {
        print(navigationController.viewControllers.count)
    }
}
