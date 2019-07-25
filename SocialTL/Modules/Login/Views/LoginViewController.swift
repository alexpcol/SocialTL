//
//  LoginViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

enum LoginForm: Int {
    case email
    case password
}

class LoginViewController: GenericFormVC, Storyboarded, LoginViewable {

    @IBOutlet private weak var apptTitle: UILabel!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    
    private var presenter: LoginPresentable!
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //    MARK:- Protocol Implementation
    func setup(presenter: LoginPresentable) {
        self.presenter = presenter
    }
    
    func show(alert: AlertHeaderModel) {
        Alerts.shared.showOKAlert(title: alert.title, message: alert.message, inView: self)
    }
    
    //    MARK:- Actions
    @IBAction func signInTapped(_ sender: UIButton) {
        presenter.signInUser()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        presenter.signUpUser()
    }
    
    private func configure() {
        
        emailTextfield.tag = LoginForm.email.rawValue
        passwordTextfield.tag = LoginForm.password.rawValue
    }
}

extension LoginViewController {
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            presenter.startEditing(field: textField, withText: text)
        }
    }
}
