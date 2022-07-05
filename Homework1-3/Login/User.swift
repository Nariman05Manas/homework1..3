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
   
    private let user: User
    
    init(name: String, avatar: String, status: String) {
        self.user = User(name: name, avatar: UIImage(named: avatar), status: status)
    }
    
    func getUser(name: String) -> User? {
        if name == user.name {
            return user
        }
       return nil
    }
    
}

class TestUserService: UserService {
    
    private let user: User
    
    init(name: String, avatar: String, status: String) {
        self.user = User(name: "Голум", avatar: UIImage(named: "gend"), status: "Моя прелесть")
    }
    
    func getUser(name: String) -> User? {
        
        if name == user.name {
            return user
        }
        return nil
    }
    
}


