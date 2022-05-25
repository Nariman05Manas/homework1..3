//
//  User.swift
//  Homework1-3
//
//  Created by qwerty on 22.04.2022.
//

import UIKit

class User {
    let name: String
    let avatar: UIImage?
    let status: String
    
    init(name: String, avatar: UIImage?, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

protocol UserService {
    func getUser(name: String) -> User?
}

class CurrentUserService: UserService {
    
    private let user: User? = nil
    
    func getUser(name: String) -> User? {
        if let activeUser = user {
            if name == activeUser.name {
                return user
            }
        }
        return nil
    }
    
}

class TestUserService: UserService {
    
    private let user: User
    
    init() {
        self.user = User(name: "Голум", avatar: UIImage(named: "gend"), status: "моя прелесть")
    }
    
    func getUser(name: String) -> User? {
        
        if name == user.name {
            return user
        }
        return nil
    }
    
}
