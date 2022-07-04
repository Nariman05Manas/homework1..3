//
//  FeedModel.swift
//  Homework1-3
//
//  Created by qwerty on 26.05.2022.
//

import Foundation
import UIKit

struct FeedPost {
    var title: String
    var image: UIImage
    var info: String
    var postType: PostType
}

enum PostType {
    case testStruct
    case planet
    case resident
}

struct TestStruct: Codable {
    var title: String
}

struct Planet: Codable {
    var orbitalPeriod: String
    var residents: [String]
    
    enum CodingKeys: String, CodingKey {
        case orbitalPeriod = "orbital_period"
        case residents
    }
}

struct Resident: Codable {
    var name: String
}

class FeedModel {
   
    weak var coordinator: FeedCoordinator?
    
    init(coordinator:FeedCoordinator){
        self.coordinator = coordinator
    }
    
    func getPost() -> [FeedPost] {
        
        var postArray = [FeedPost]()
        let firstPost = FeedPost(title: "Первое задание",
                                 image: UIImage(named: "gend")!,
                                 info: "https://jsonplaceholder.typicode.com/todos/" + String(Int.random(in: 1...20)),
                                 postType: .testStruct)
        
        postArray.append(firstPost)
        let secondPost = FeedPost(title: "задание с планетой татуин",
                                  image: UIImage(named: "gend1")!,
                                  info: "https://swapi.dev/api/planets/1",
                                  postType: .planet)
        
        postArray.append(secondPost)
        return postArray
    }
        
}
