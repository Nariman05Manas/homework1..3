//
//  File.swift
//  Homework1-3
//
//  Created by qwerty on 09.03.2022.
//

import UIKit
import StorageService

//пост массив
let constPostArray = [Posts(author: "Gendale", description: "Местный сторож", image: "gend", likes: 11098, views: 2997645),
                      Posts(author: "Голум)))", description: "Моя прелесть", image: "gend1", likes:23343, views: 4646),
                      Posts(author: "Моя братва", description: "Все в сборе", image: "gend2", likes: 556577, views: 4546565),
                      Posts(author: "Левый чел", description: "Какой то левый чел", image: "gend3", likes: 666, views: 777)]

//массив фото
let photosGaleryArray = [UIImage(named:"фото1")!, UIImage(named:"фото2")!, UIImage(named:"фото3")!, UIImage(named:"фото4")!, UIImage(named:"фото5")!, UIImage(named:"фото6")!, UIImage(named:"фото8")!, UIImage(named:"фото9")!, UIImage(named:"фото10")!,UIImage(named:"фото11")!, UIImage(named:"фото12")!, UIImage(named:"фото13")!]

// констреинт
struct Const {
    
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 16
    static let smallIndent: CGFloat = 8
    static let smallSize: CGFloat = 20
    static let size: CGFloat = 50
    static let bigSize: CGFloat = 100
    static let bigIndent: CGFloat = 120
    
}

public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}

var infoArray = [""]
