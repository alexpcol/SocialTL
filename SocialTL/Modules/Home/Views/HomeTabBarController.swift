//
//  HomeTabBarController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController, HomeTabBarViewable {
    
    var coordinators: [Coordinator]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(coordinators: [Coordinator]) {
        self.coordinators = coordinators
        startCoordinators()
    }
    
    private func startCoordinators() {
        var controllers: [UINavigationController] = []
        for coordinator in coordinators {
            coordinator.start()
            controllers.append(coordinator.navigationController)
        }
        viewControllers = controllers
    }
    
    
}
