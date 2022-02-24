//
//  AppDelegate.swift
//  Navigation
//
//  Created by Shom on 10.02.2022.
//



import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        self.window?.rootViewController = tabBarController
        
        tabBarController.tabBar.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        let feedViewController = FeedViewController()
        feedViewController.view.backgroundColor = .systemMint
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem = UITabBarItem(title: "NEWSFEED", image: UIImage(named: "news"), selectedImage: nil)
        feedNavigationController.navigationBar.barTintColor = UIColor.white
        feedNavigationController.navigationBar.standardAppearance = appearance;
        feedNavigationController.navigationBar.scrollEdgeAppearance = feedNavigationController.navigationBar.standardAppearance
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "PROFILE", image: UIImage(named: "profile"), selectedImage: nil)
        profileViewController.view.backgroundColor = .lightGray
        profileNavigationController.navigationBar.standardAppearance = appearance;
        profileNavigationController.navigationBar.scrollEdgeAppearance = profileNavigationController.navigationBar.standardAppearance
        
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        tabBarController.tabBar.isHidden = false

        self.window?.makeKeyAndVisible()
        return true
    }
    
}
