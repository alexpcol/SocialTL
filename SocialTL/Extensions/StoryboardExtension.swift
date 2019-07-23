//
//  StoryboardExtension.swift
//  SocialTL
//
//  Created by Alejandro Perez on 7/23/19.
//  Copyright © 2019 Alejandro Perez. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(fromStoryboard nibName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard nibName: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: nibName, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
