//
//  User.swift
//  Homework1-3
//
//  Created by qwerty on 22.04.2022.
//

import UIKit

struct User {
    
    var name: String?
    var password: String?
    var status: String?
    var avatarName: String?
    var avatar: UIImage? {
        get {
            if let avatarName = avatarName {
                return UIImage(named: avatarName)
            } else {
                return nil
            }
        }
    }
    
    var keyedValues: [String: Any] {
        return [
            "name": self.name ?? "",
            "password": self.password ?? "",
            "status": self.status ?? "",
            "avatarName": self.avatarName ?? ""
        ]
    }
}

protocol UserService {
    func getUser(name: String) -> User?
}

class CurrentUserService: UserService {
    
   
    
    private let user: User
    
    init(name: String, avatar: String, status: String) {
        self.user = User(name: name, password: "", status: status, avatarName: avatar)
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
        self.user = User(name: name, password: "", status: status, avatarName: avatar)
    }
    
    func getUser(name: String) -> User? {
        
        if name == user.name {
            return user
        }
        return nil
    }
    
}
