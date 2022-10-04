//
//  File.swift
//  Homework1-3
//
//  Created by qwerty on 09.03.2022.
//

import UIKit
import StorageService

extension NSNotification.Name {
     static let wasLikedPost = NSNotification.Name("wasLikedPost")
     static let didRemovePostFromFavorites = NSNotification.Name("didRemovePostFromFavorites")
 }


enum AppError: Error {
     case unauthorized
     case notFound
     case badData
     case internalServer
 }

//пост массив


let constPosts = [FeedPost(id: 1,
                           title: "пост 1",
                           author: "гендаль",
                           description: "https://jsonplaceholder.typicode.com/todos/" + String(Int.random(in: 1...20)),
                           image: "gend",
                           likes: 547857,
                           views: 45455,
                           postType: .webDescription),
                  FeedPost(id: 2,
                           title: "пост 2",
                           author: "доби",
                           description: "https://swapi.dev/api/planets/1",
                           image: "gend1",
                           likes: 333,
                           views: 45666,
                           postType: .planet),
                  FeedPost(id: 3,
                           title: "моя братва",
                           author: "GENDALE",
                           description: "четкий кадр",
                           image: "фото3",
                           likes: 8899,
                           views: 33434,
                           postType: .post),
                  FeedPost(id: 4,
                           title: "на задании",
                           author: "GENDALE",
                           description: "рабочие моменты",
                           image: "фото1",
                           likes: 3434,
                           views: 3445677,
                           postType: .post),
                  FeedPost(id: 5,
                           title: "опять мы",
                           author: "GENDALE",
                           description: "корпоратив))",
                           image: "фото2",
                           likes: 777,
                           views: 777,
                           postType: .post),
                  FeedPost(id: 6,
                           title: "какой то левый чел",
                           author: "GENDALE",
                           description: "лайк поставь!",
                           image: "фото4",
                           likes: 1000029,
                           views: 39899,
                           postType: .post)]

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
    static let postSizeWidth: CGFloat = UIScreen.main.bounds.width - 32
    static let postSizeHeight: CGFloat = UIScreen.main.bounds.width + 100
    
}

public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}

extension String {
    
    static let empty = ""
    static let whitespace: Character = " "
    
    var localized: String { NSLocalizedString(self, comment: "") }
    
    var isFirstCharacterWhitespace: Bool {
        return self.first == Self.whitespace
    }
    
    func localizedNumeric(numeric: Int) -> String {
        
        var string = NSLocalizedString(self, comment: "")
        string = String.localizedStringWithFormat(string, numeric)
        return string
    }

     func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
         let dateFormatter = DateFormatter()
         dateFormatter.timeZone = TimeZone(identifier: "UTC")
         dateFormatter.calendar = Calendar(identifier: .gregorian)
         dateFormatter.dateFormat = format
         let date = dateFormatter.date(from: self)
         return date
     }

     /// Замена паттерна строкой.
     /// - Parameters:
     ///   - pattern: Regex pattern.
     ///   - replacement: Строка, на что заменить паттерн.
     func replace(_ pattern: String, replacement: String) throws -> String {
         let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
         return regex.stringByReplacingMatches(in: self,
                                               options: [.withTransparentBounds],
                                               range: NSRange(location: 0, length: self.count),
                                               withTemplate: replacement)
     }

     static func randomString(length: Int = 36) -> Self {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
       return String((0..<length).compactMap { _ in letters.randomElement() })
     }
 }

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

