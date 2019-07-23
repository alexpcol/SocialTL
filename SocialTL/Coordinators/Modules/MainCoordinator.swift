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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK:- MVP Methods
    func start() {
        if isUserLoggedIn() {
            
        } else {
            routeLogin()
        }
    }
    
    private func routeHome() {
        print("Home")
        let home = HomeTabBarController()
        let presenter = HomeTabBarPresenter()
        
    }
    
    private func routeLogin() {
        //This one take the place of out start
        let loginViewController = LoginViewController.instantiate(fromStoryboard: "Main")
        let presenter = LoginPresenter(withCoordinator: self)
        presenter.attach(view: loginViewController as LoginViewable)
        navigationController.pushViewController(loginViewController, animated: true)
        
    }
    
    
    private func isUserLoggedIn() -> Bool {
        if Firebase.Auth.auth().currentUser != nil {
            print("User logged in")
            return true
        } else {
            print("User not logged in")
            return false
        }
    }
}
