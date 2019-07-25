//
//  LoginCoordinator.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit
import Firebase

class TimelineCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: HomeCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK:- MVP Methods
    func start() {
        let timelineViewController = TimelineViewController.instantiate(fromStoryboard: "Timeline")
        let presenter = TimelinePresenter(withCoordinator: self)
        presenter.attach(view: timelineViewController as TimelineViewable)
        navigationController.pushViewController(timelineViewController, animated: true)
    }
    
    func addPost() {
        let addPostViewController = AddPostViewController.instantiate(fromStoryboard: "Timeline")
        let presenter = AddPostPresenter(withCoordinator: self)
        presenter.attach(view: addPostViewController as AddPostViewable)
        navigationController.pushViewController(addPostViewController, animated: true)
    }
    
}
