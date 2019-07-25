//
//  SignupPresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit
import Firebase


class SignupPresenter: SignupPresentable {
    private weak var view: SignupViewable?
    private var coordinator: LoginCoordinator
    private var username: String?
    private var email: String?
    private var password: String?
    private var api: API
    private var databaseManager: DatabaseManager?
    
    init(withCoordinator coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        api = API()
    }
    
    func attach(view: SignupViewable) {
        self.view = view
        self.view?.setup(presenter: self as SignupPresentable)
    }
    
    func signUpUser() {
        if validateForm() {
            signupFirebase()
        } else {
            let alert = AlertHeaderModel(title: "Error", message: "Missing Value!")
            view?.show(alert: alert)
        }
    }
    
    func startEditing(field: UITextField, withText text: String) {
        switch field.tag {
        case SignupForm.username.rawValue:
            username = text
        case SignupForm.email.rawValue:
            email = text
        case SignupForm.password.rawValue:
            password = text
        default:
            print("error")
        }
    }
    
    private func signupFirebase() {
        api.registerUser(withUsername: username!, email: email!, andPassword: password!) { (result) in
            switch result {
            case .success(let data):
                let user = data as! User
                self.create(user)
            case .failure(let e):
                print(e)
            }
        }
    }
    
    private func create(_ user: User) {
        databaseManager = DatabaseManager(userid: user.uid)
        databaseManager?.create(user: user, completion: { (result) in
            switch result {
            case .success( _):
                self.coordinator.routeHome()
            case .failure(let e):
                print(e)
            }
        })
    }
    
    private func validateForm() -> Bool {
        if username == nil {
            return false
        }
        if email == nil {
            return false
        }
        if password == nil {
            return false
        }
        return true
    }
}
