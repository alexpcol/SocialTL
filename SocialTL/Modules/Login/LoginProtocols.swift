//
//  LoginProtocols.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

protocol LoginPresentable {
    func loginUser()
}

protocol LoginViewable: class {
    func setup(title: String, presenter: LoginPresentable)
}

//MARK:- Signup
protocol SignupPresentable {
    func signUpUser()
}

protocol SignupViewable: class {
    func setup(title: String, presenter: SignupPresentable)
    func closeView()
}
