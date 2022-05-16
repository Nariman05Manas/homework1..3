//
//  Factory.swift
//  Homework1-3
//
//  Created by qwerty on 29.04.2022.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    
    func checkPassword(login: String, password: String) -> Bool
}

class LoginInspector: LoginViewControllerDelegate  {
    
    func checkPassword(login: String, password: String) -> Bool {
        Checker.shared.checkUserData(checkLogin: login.hash, checkPassword: password.hash)
    }
    
}

class Checker {
    
    static let shared: Checker = {
       Checker()
    }()
    
    private let login = "user".hash
    private let pswd = "1234".hash
    
    private init() {}
    
    public func checkUserData(checkLogin: Int, checkPassword: Int) -> Bool {
        checkLogin == login && checkPassword == pswd
    }
    
}

protocol LoginFactory {
    func creatLoginInspector() -> LoginViewControllerDelegate
}

class MyLoginFactory: LoginFactory {
    func creatLoginInspector() -> LoginViewControllerDelegate {
        LoginInspector()
    }
}
