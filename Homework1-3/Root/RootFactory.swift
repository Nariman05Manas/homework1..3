//
//  RootFactory.swift
//  Homework1-3
//
//  Created by qwerty on 26.05.2022.
//
import Foundation
import UIKit


final class RootFactory {
    
    enum State {
        case feed
        case profile
        case player
        case favorite
        case map
    }
    
    var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func startModule(coordinator: VCCoordinator,
                     data: (userService: UserService, name: String)?,
                     dbCoordinator: DatabaseCoordinatable? = nil) -> UINavigationController? {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        switch state {
        case .feed:
            let viewModel = FeedModel(coordinator: coordinator as! FeedCoordinator)
            let feedViewController = FeedViewController(coordinator: coordinator as! FeedCoordinator, model: viewModel, dbCoordinator: dbCoordinator!)
            feedViewController.view.backgroundColor = UIColor.white
            let feedNavigationController = UINavigationController(rootViewController: feedViewController)
            
            feedNavigationController.tabBarItem = UITabBarItem(title: LocalizableService.getText(key: .feed), image: UIImage(named: "Feed"), selectedImage: UIImage(named: "SelectedFeed"))
            feedNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
            feedNavigationController.navigationBar.barTintColor = UIColor.white
            feedNavigationController.navigationBar.standardAppearance = appearance;
            feedNavigationController.navigationBar.scrollEdgeAppearance = feedNavigationController.navigationBar.standardAppearance
            return feedNavigationController
            
        case .profile:
            
            if let userData = data {
                let profileViewController = ProfileViewController(coordinator: coordinator as! ProfileCoordinator, userService: userData.userService, name: userData.name)
                let profileNavigationController = UINavigationController(rootViewController: profileViewController)
                
                profileNavigationController.tabBarItem = UITabBarItem(title: LocalizableService.getText(key: .profile), image: UIImage(named: "Profile"), selectedImage: UIImage(named: "SelectedProfile"))
                profileNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
                profileNavigationController.navigationBar.barTintColor = UIColor.white
                profileNavigationController.navigationBar.standardAppearance = appearance;
                profileNavigationController.navigationBar.scrollEdgeAppearance = profileNavigationController.navigationBar.standardAppearance
                
                return profileNavigationController
            }
            
        case .player:
            
            let playerViewController = MusicPlayer(coordinator: coordinator as! AudioPlayerCordinator)
            let playerNavigationController = UINavigationController(rootViewController: playerViewController)
            
            playerNavigationController.tabBarItem = UITabBarItem(title: LocalizableService.getText(key: .music), image: UIImage(named: "music"), selectedImage: UIImage(named: "SelectedMusic"))
            playerNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
            playerNavigationController.navigationBar.barTintColor = UIColor.white
            playerNavigationController.navigationBar.standardAppearance = appearance;
            playerNavigationController.navigationBar.scrollEdgeAppearance = playerNavigationController.navigationBar.standardAppearance
            
            return playerNavigationController
            
        case .favorite:
            
            let favoriteViewController = Favorite(coordinator: coordinator as! FavoriteCoordinator, dbCoordinator: dbCoordinator!)
            favoriteViewController.view.backgroundColor = UIColor.white
            let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
            
            favoriteNavigationController.tabBarItem = UITabBarItem(title: LocalizableService.getText(key: .favorites), image: UIImage(named: "Feed"), selectedImage: UIImage(named: "SelectedFeed"))
            favoriteNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
            favoriteNavigationController.navigationBar.barTintColor = UIColor.white
            favoriteNavigationController.navigationBar.standardAppearance = appearance;
            favoriteNavigationController.navigationBar.scrollEdgeAppearance = favoriteNavigationController.navigationBar.standardAppearance
            return favoriteNavigationController
            
        case .map:
            
            let mapViewController = MapsViewController()
            mapViewController.view.backgroundColor = UIColor.white
            let mapavigationController = UINavigationController(rootViewController: mapViewController)
            
            mapavigationController.tabBarItem = UITabBarItem(title: LocalizableService.getText(key: .map), image: UIImage(named: "Profile"), selectedImage: UIImage(named: "SelectedProfile"))
            mapavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
            mapavigationController.navigationBar.barTintColor = UIColor.white
            mapavigationController.navigationBar.standardAppearance = appearance;
            mapavigationController.navigationBar.scrollEdgeAppearance = mapavigationController.navigationBar.standardAppearance
            return mapavigationController
        }
        
        return nil
        
    }
    
}
