//
//  Factory.swift
//  Homework1-3
//
//  Created by qwerty on 05.07.2022.
//

import Foundation
protocol LoginFactory {
    func creatLoginInspector() -> LoginViewControllerDelegate
}

class MyLoginFactory: LoginFactory {
    func creatLoginInspector() -> LoginViewControllerDelegate {
        LoginInspector()
    }
}
