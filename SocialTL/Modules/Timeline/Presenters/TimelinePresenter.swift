//
//  TimelinePresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class TimelinePresenter: TimelinePresentable {
    private weak var view: TimelineViewable?
    private var coordinator: TimelineCoordinator
    
    init(withCoordinator coordinator: TimelineCoordinator) {
        self.coordinator = coordinator
    }
    
    func attach(view: TimelineViewable) {
        self.view = view
        self.view?.setup(title: "Timeline", presenter: self as TimelinePresentable)
        self.view?.setSection(icon: "person", title: "Feed")
        self.view?.showAddButton(action: {
            self.coordinator.addPost()
        })
    }
    
    func fetchPosts() {
        print("fetch")
    }
    
    private func addPost() {
        coordinator.addPost()
    }
    
    
}
