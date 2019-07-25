//
//  LoadingViewController.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, LoadingViewable, Storyboarded {

    private var presenter: LoadingPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.routeToInitialScreen()
    }
    
    func setup(presenter: LoadingPresentable) {
        self.presenter = presenter
    }

}
