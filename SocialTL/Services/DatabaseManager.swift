//
//  DatabaseManager.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/25/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import Foundation
import Firebase

class DatabaseManager {
    private var databaseReference: DatabaseReference!
    private var userid: String
    
    init(userid: String){
        databaseReference = Database.database().reference()
         self.userid = userid
    }
    
    func create(user: User, completion: @escaping Response) {
        databaseReference.child("users")
        .child(user.uid).setValue(["username": user.username,
                                       "useremail": user.email]) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    func fetchUser(completion: @escaping Response) {
        databaseReference.child("users").child(userid).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? NSDictionary,
            let username = value["username"] as? String,
            let useremail = value["useremail"] as? String else {
                return
            }
            if let userimage = value["userimage"] as? String {
                completion(.success(User(uid: self.userid,
                                         username: username,
                                         email: useremail,
                                         userImage: URL(string: userimage))))
            } else {
                completion(.success(User(uid: self.userid,
                                         username: username,
                                         email: useremail)))
            }
            
        }) { (error) in
            completion(.failure(error))
        }
    }
}
