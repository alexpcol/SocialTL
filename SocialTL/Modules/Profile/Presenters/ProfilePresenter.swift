//
//  ProfilePresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class ProfilePresenter : ProfilePresentable {
    private weak var view: ProfileViewable?
    private var coordinator: ProfileCoordinator
    private var api: API
    
    init(withCoordinator coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        api = API()
    }
    
    func attach(view: ProfileViewable) {
        self.view = view
        self.view?.setup(title: "Profile", presenter: self as ProfilePresentable)
        self.view?.setSection(icon: "profile", title: "Profile")
    }
    
    func signout() {
        api.signOut { (result) in
            switch result {
            case .success( _):
                self.coordinator.signOut()
            case .failure(let e):
                print(e)
            }
        }
    }
}
