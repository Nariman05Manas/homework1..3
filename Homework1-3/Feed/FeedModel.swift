//
//  FeedModel.swift
//  Homework1-3
//
//  Created by qwerty on 26.05.2022.
//

import Foundation

class FeedModel {
    
    var infoArray = ["знакомьтесь это моя банда","моя прелестьььььь"]
    
    weak var coordinator: FeedCoordinator?
    
    init(coordinator:FeedCoordinator){
        self.coordinator = coordinator
    }
    
    func check(word: String) -> Bool {
            return word == "Зеленый"
    }
    func getPost(sender: CustomButton) {
        let post = PostMain(title: sender.title(for: .normal)!, image: sender.image(for: .normal)!, info: infoArray[sender.tag])
        coordinator!.pushPost(post: post)
     }
    }
