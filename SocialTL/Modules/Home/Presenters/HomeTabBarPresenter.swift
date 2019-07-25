//
//  HomeTabBarPresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class HomeTabBarPresenter: HomeTabBarPresentable {
    private weak var view: HomeTabBarViewable?
    private var coordinator: HomeCoordinator
    
    private var timelineCoordinator: TimelineCoordinator!
    private var profileCoordinator: ProfileCoordinator!
    private var user: User
    
    init(withCoordinator coordinator: HomeCoordinator, andUser user: User) {
        self.user = user
        self.coordinator = coordinator
    }
    
    func attach(view: HomeTabBarViewable) {
        self.view = view
        setChildCoordinators()
        self.view?.setup(coordinators: [timelineCoordinator, profileCoordinator])
    }
    
    private func setChildCoordinators() {
        self.setTimelineCoordinator()
        self.setProfileCoordinator()
    }
    
    private func setTimelineCoordinator() {
        timelineCoordinator = TimelineCoordinator(navigationController: UINavigationController())
        timelineCoordinator.parentCoordinator = coordinator
        coordinator.childCoordinators.append(timelineCoordinator!)
    }
    
    private func setProfileCoordinator() {
        profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        profileCoordinator.parentCoordinator = coordinator
        coordinator.childCoordinators.append(profileCoordinator!)
    }
}
