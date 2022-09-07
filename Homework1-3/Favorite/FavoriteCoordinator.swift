//
//  FavoriteCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 31.07.2022.
//

import UIKit

class FavoriteCoordinator: VCCoordinator {
    
    var navigationController: UINavigationController?
    
    func Start(dbCoordinator: DatabaseCoordinatable?) throws -> UINavigationController? {
        let factory = RootFactory(state: .favorite)
        navigationController = factory.startModule(coordinator: self, data: nil, dbCoordinator: dbCoordinator)
        return navigationController
    }
    
    func showPost(_ post: FeedPost) {
        navigationController?.pushViewController(PostViewController(coordinator: self, post: post), animated: true)
    }
    
    func showInfo(_ title: String, people: [String]? = nil) {
        navigationController?.present(InfoViewController(title: title, residentUrl: people), animated: true)
    }
}

