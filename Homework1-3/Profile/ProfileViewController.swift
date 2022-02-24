//
//  ProfileViewController.swift
//  Homework1-3
//
//  Created by qwerty on 19.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой профиль"
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileHeaderView)
        
    }
    override func viewWillLayoutSubviews() {
        self.view.subviews.first?.frame = self.view.frame
    
 }
    
}
