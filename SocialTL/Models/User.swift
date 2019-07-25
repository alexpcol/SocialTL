//
//  User.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

struct User {
    var uid: String
    var username: String
    var email: String
    var userImage: URL?
    
    init(uid: String, username: String, email: String, userImage: URL? = nil) {
        self.uid = uid
        self.username = username
        self.email = email
        self.userImage = userImage
    }
}
