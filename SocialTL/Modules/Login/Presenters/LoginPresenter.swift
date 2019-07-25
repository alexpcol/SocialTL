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
    private var coordinator: LoginCoordinator
    private var email: String?
    private var password: String?
    private var api: API
    private var databaseManager: DatabaseManager?
    
    private var screenTitle: String = "Login"
    
    init(withCoordinator coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        api = API()
    }
    
    func attach(view: LoginViewable) {
        self.view = view
        self.view?.setup(presenter: self as LoginPresentable)
    }
    
    func signInUser() {
        if validateForm() {
            signinFirebase()
        } else {
            let alert = AlertHeaderModel(title: "Error", message: "Missing Value!")
            view?.show(alert: alert)
        }
    }
    
    func signUpUser() {
        coordinator.signUp()
    }
    
    func startEditing(field: UITextField, withText text: String) {
        switch field.tag {
        case LoginForm.email.rawValue:
            email = text
        case LoginForm.password.rawValue:
            password = text
        default:
            print("error")
        }
    }
    
    private func signinFirebase() {
        api.signinUser(email: email!, password: password!) { (result) in
            switch result {
            case .success(let data):
                self.coordinator.routeHome()
            case .failure(let e):
                print(e)
            }
        }
    }
    
    private func fetch(userid: String, completion: @escaping Response) {
        databaseManager = DatabaseManager(userid: userid)
        databaseManager?.fetchUser(completion: { (result) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let e):
                completion(.failure(e))
            }
        })
    }
    
    private func validateForm() -> Bool {
        if email == nil {
            return false
        }
        if password == nil {
            return false
        }
        return true
    }
}
