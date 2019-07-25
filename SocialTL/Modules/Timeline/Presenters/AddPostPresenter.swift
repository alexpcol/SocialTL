//
//  AddPostPresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class AddPostPresenter: AddPostPresentable {
    private weak var view: AddPostViewable?
    private var coordinator: TimelineCoordinator
    
    init(withCoordinator coordinator: TimelineCoordinator) {
        self.coordinator = coordinator
    }
    
    func attach(view: AddPostViewable) {
        self.view = view
    }
    
    func signUpUser() {
        print("lol")
    }
}
