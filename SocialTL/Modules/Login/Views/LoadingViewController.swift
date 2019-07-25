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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        presenter.routeToInitialScreen()
    }
    
    func setup(presenter: LoadingPresentable) {
        self.presenter = presenter
    }

}
