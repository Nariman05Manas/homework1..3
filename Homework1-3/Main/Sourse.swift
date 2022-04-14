//
//  File.swift
//  Homework1-3
//
//  Created by qwerty on 09.03.2022.
//

import UIKit
import StorageService


let constPostArray = [Posts(author: "Gendale", description: "Местный сторож", image: "gend", likes: 11098, views: 2997645),
                 Posts(author: "Голум)))", description: "Моя прелесть", image: "gend1", likes:23343, views: 4646),
                 Posts(author: "Моя братва", description: "Все в сборе", image: "gend2", likes: 556577, views: 4546565),
                 Posts(author: "Левый чел", description: "Какой то левый чел", image: "gend3", likes: 666, views: 777)]

let photosGaleryArray = ["фото1", "фото2", "фото3", "фото4", "фото5", "фото6", "фото7", "фото8", "фото9", "фото10", "фото11", "фото12", "фото13"]

struct Const {
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 16
    
}




public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }

}

