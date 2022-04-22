//
//  User.swift
//  Homework1-3
//
//  Created by qwerty on 22.04.2022.
//

import UIKit

protocol UserService {
    func userSetup(_ name: String) -> User?
}

class User {
    var name: String
    var avatar: UIImage?
    var status: String
    
    init(name: String, avatar: UIImage?, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    let currentUser: User? = nil
    
    func userSetup(_ name: String) -> User? {
        if let myNameUser = currentUser {
            if name == myNameUser.name {
                return currentUser
            }
        }
        return nil
    }
}
//Класс тест для дебага
class TestUserService: UserService {
    let testUser = User(name: "I'M GOLUM", avatar: UIImage(named: "фото6"), status: "Моя прелесть")
    
    func userSetup(_ name: String) -> User? {
        if name == testUser.name {
            return nil
        }
        return testUser
    }
    
}
