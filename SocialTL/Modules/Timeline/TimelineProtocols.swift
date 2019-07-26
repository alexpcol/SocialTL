//
//  TimelineProtocols.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

protocol TimelinePresentable {
    func fetchPosts()
}

protocol TimelineViewable: class {
    func setup(title: String, presenter: TimelinePresentable)
    func setSection(icon: String, title: String)
    func showAddButton(action: @escaping () -> Void)
}

//MARK:- AddPost
protocol AddPostPresentable {
    func signUpUser()
}

protocol AddPostViewable: class {
    func setup(presenter: AddPostPresentable)
}
