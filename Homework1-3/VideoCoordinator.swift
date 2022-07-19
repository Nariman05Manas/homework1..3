//
//  VideoCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 20.06.2022.
//

import Foundation
import UIKit

class VideoPlayerCoordinator: VCCoordinator {
    
    var navigationController: UINavigationController?
    
    func Start() throws -> UINavigationController? {
        let factory = RootFactory(state: .video)
        navigationController = factory.startModule(coordinator: self, data: nil)
        return navigationController
    }
}
