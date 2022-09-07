//
//  MusicPlayerCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 20.06.2022.
//

import Foundation
import UIKit

class AudioPlayerCordinator: VCCoordinator {
    
    var navigationController: UINavigationController?
    
    func Start(dbCoordinator: DatabaseCoordinatable? = nil) throws -> UINavigationController? {
        let factory = RootFactory(state: .player)
        navigationController = factory.startModule(coordinator: self, data: nil)
        return navigationController
    }
}
