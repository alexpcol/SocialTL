//
//  LoginPresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresentable {
    private weak var view: LoginViewable?
    private var coordinator: MainCoordinator!
    
    private var screenTitle: String = "Login"
    
    init(withCoordinator coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func attach(view: LoginViewable) {
        self.view = view
        self.view?.setup(title: screenTitle, presenter: self as LoginPresentable)
    }
    
    func loginUser() {
        print("hello")
    }
}
