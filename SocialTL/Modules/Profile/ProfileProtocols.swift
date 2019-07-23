//
//  ProfileProtocols.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

protocol ProfilePresentable {
    func loginUser()
}

protocol ProfileViewable: class {
    func setup(title: String, presenter: ProfilePresentable)
}
