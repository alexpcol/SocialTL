//
//  LoadingPresenter.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit
import Firebase

class LoadingPresenter: LoadingPresentable {
    private weak var view: LoadingViewable?
    private var coordinator: MainCoordinator
    private var databaseManager: DatabaseManager?
    
    init(withCoordinator coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func attach(view: LoadingViewable) {
        self.view = view
        self.view?.setup(presenter: self as LoadingPresentable)
    }
    
    func routeToInitialScreen() {
        isUserLoggedIn { (result) in
            switch result {
            case .success(let data):
                let user  = data as! User
                self.coordinator.routeHome(for: user)
            case .failure( _):
                self.coordinator.routeLogin()
            }
        }
    }
    
    private func isUserLoggedIn(completion: @escaping Response) {
        if let firebaseUser = Firebase.Auth.auth().currentUser {
            fetch(userid: firebaseUser.uid) { (result) in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let e):
                    completion(.failure(e))
                }
            }
        } else {
            completion(.failure("nil"))
        }
    }
    private func fetch(userid: String, completion: @escaping Response) {
        databaseManager = DatabaseManager(userid: userid)
        databaseManager?.fetchUser(completion: { (result) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let e):
                completion(.failure(e))
            }
        })
    }
}

