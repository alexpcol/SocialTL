//
//  API.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/24/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import Firebase

enum Result {
    case success(Any)
    case failure(Any)
}
typealias Response = (Result) -> Void

class API {
    private var auth: Auth
    
    init() {
        auth = Auth.auth()
    }
    
    func signinUser(email: String, password: String, completion: @escaping Response) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            guard let firebaseUser = result?.user, let email = firebaseUser.email ,error == nil else {
                completion(.failure(error!))
                return
            }
            let user = User(uid: firebaseUser.uid, username: email, email: email)
            completion(.success(user))
        }
    }
    
    func registerUser(withUsername username: String, email: String, andPassword password: String, completion: @escaping Response) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            guard let firebaseUser = result?.user, let email = firebaseUser.email ,error == nil else {
                completion(.failure(error!))
                return
            }
            let user = User(uid: firebaseUser.uid, username: username, email: email)
            completion(.success(user))
        }
    }
    
    func signOut(completion: @escaping Response) {
        do{
            try auth.signOut()
            completion(.success(true))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
}
