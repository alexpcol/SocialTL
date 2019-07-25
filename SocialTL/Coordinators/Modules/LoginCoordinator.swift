//
//  LoginCoordinator.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate(fromStoryboard: "Main")
        let presenter = LoginPresenter(withCoordinator: self)
        presenter.attach(view: loginViewController as LoginViewable)
        navigationController.pushViewController(loginViewController, animated: false)
    }
    
    func signUp() {
        let signupViewController = SignupViewController.instantiate(fromStoryboard: "Main")
        let presenter = SignupPresenter(withCoordinator: self)
        presenter.attach(view: signupViewController as SignupViewable)
        navigationController.pushViewController(signupViewController, animated: true)
    }
    
    func dismissLogin() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: false)
    }
}
