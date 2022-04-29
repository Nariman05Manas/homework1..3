//
//  Factory.swift
//  Homework1-3
//
//  Created by qwerty on 29.04.2022.
//

import Foundation

protocol LoginFactory {
    func myFactory() -> LoginInspector
}

class Factory: LoginFactory {
    
    static let shared = Factory()
    
    func myFactory() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
    
}
