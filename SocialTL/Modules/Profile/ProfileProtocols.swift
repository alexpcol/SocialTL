//
//  ProfileProtocols.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

protocol ProfilePresentable {
    func signout()
}

protocol ProfileViewable: class {
    func setup(title: String, presenter: ProfilePresentable)
    func setSection(icon: String, title: String)
}
