//
//  RootCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 26.05.2022.
//

import Foundation
import UIKit

protocol RootCoordinator {
    func startApp(authenticationData: (userService: UserService, name: String)?) -> UIViewController
}

protocol VCCoordinator {
    var navigationController: UINavigationController? { get set }
    func Start(dbCoordinator: DatabaseCoordinatable?) throws -> UINavigationController?
}

class UITabBarCoordinator: RootCoordinator {
    
    enum action {
        case autorization
        case allApp
    }
    
    func startApp(authenticationData: (userService: UserService, name: String)?) -> UIViewController {
        let tabBar = TabBarController(coordinator: self, activView: .autorization, authenticationData: authenticationData)
        tabBar.tabBar.backgroundColor = UIColor.createColor(lightMode: .white, darkMode: .darkGray)
        return tabBar
    }
}
