//
//  FeedCoordinator.swift
//  Homework1-3
//
//  Created by qwerty on 26.05.2022.
//

import Foundation
import UIKit

class FeedCoordinator: VCCoordinator {
    
    var navigationController: UINavigationController?
    
    func Start() throws -> UINavigationController? {
        let factory = RootFactory(state: .feed)
        navigationController = factory.startModule(coordinator: self, data: nil)
        return navigationController
    }
    
    func pushPost(post: PostMain) {
        let postViewController = PostViewController(coordinator: self, post: post)
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    func showInfoPost(info: String) {
        let infoViewController = InfoViewController(title: info)
        navigationController!.present(infoViewController, animated: true, completion: nil)
    }
    
    func showBuyVersion() {
        let subscription = BuyFullVersion()
        navigationController?.present(subscription, animated: true)
    }
    
}
