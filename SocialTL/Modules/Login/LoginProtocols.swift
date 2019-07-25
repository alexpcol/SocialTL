//
//  LoginProtocols.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

//MARK:- Loading
protocol LoadingPresentable {
    func routeToInitialScreen()
}

protocol LoadingViewable: class {
    func setup(presenter: LoadingPresentable)
}

//MARK:- Login
protocol LoginPresentable {
    func signInUser()
    func signUpUser()
    func startEditing(field: UITextField, withText text: String)
}

protocol LoginViewable: class {
    func setup(presenter: LoginPresentable)
    func show(alert: AlertHeaderModel)
}

//MARK:- Signup
protocol SignupPresentable {
    func signUpUser()
    func startEditing(field: UITextField, withText text: String)
}

protocol SignupViewable: class {
    func setup(presenter: SignupPresentable)
    func show(alert: AlertHeaderModel)
}
