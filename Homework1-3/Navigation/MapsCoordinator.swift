//
//  MapsCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 21.09.2022.
//

import Foundation
import UIKit

class MapsCoordinator: VCCoordinator {
    
    var navigationController: UINavigationController?
    
    func Start(dbCoordinator: DatabaseCoordinatable? = nil) throws -> UINavigationController? {
        let factory = RootFactory(state: .map)
        navigationController = factory.startModule(coordinator: self, data: nil)
        return navigationController
    }
}
