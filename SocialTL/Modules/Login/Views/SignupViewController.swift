//
//  SignupViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

enum SignupForm: Int {
    case username
    case email
    case password
}

class SignupViewController: GenericFormVC, Storyboarded, SignupViewable {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    private var presenter: SignupPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func setup(presenter: SignupPresentable) {
        self.presenter = presenter
    }
    
    func show(alert: AlertHeaderModel) {
        Alerts.shared.showOKAlert(title: alert.title, message: alert.message, inView: self)
    }
    
    private func configure() {
        usernameTextfield.tag = SignupForm.username.rawValue
        emailTextfield.tag = SignupForm.email.rawValue
        passwordTextfield.tag = SignupForm.password.rawValue
    }
    
    //    MARK:- Actions
    @IBAction func signUpTapped(_ sender: UIButton) {
        presenter.signUpUser()
    }
}

extension SignupViewController {
    override func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            presenter.startEditing(field: textField, withText: text)
        }
    }
}
