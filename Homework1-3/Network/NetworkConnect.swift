//
//  NetworkConnect.swift
//  Homework1-3
//
//  Created by qwerty on 21.06.2022.
//

import Foundation
import UIKit

enum AppConfiguration: String {
    case people = "https://swapi.dev/api/people/8"
    case starships = "https://swapi.dev/api/starships/3"
    case planets = "https://swapi.dev/api/planets/5"
}

struct NetworkService {
    
    static func URLSessionDataTask(postInfo: String, type: PostType, callback: @escaping (_ title: String, _ people: [String]?)->Void) {
        
        if let url = URL(string: postInfo) {
            let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    NetworkService.decodePostData(data: data, type: type, callback: callback)
                }
            }
            
            task.resume()
        }
    }
    
    static func decodePostData(data: Data, type: PostType, callback: @escaping (_ title: String, _ people: [String]?)->Void) {
        
        let decoder = JSONDecoder()
        do {
            switch type {
            case .testStruct:
                let decodeData = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any>
                callback(decodeData["title"] as! String, nil)
            case .planet:
                let decodeData = try decoder.decode(Planet.self, from: data )
                callback("Подсчет периода вращения пленеты вокруг своей оси: " + decodeData.orbitalPeriod, decodeData.residents)
            case .resident:
                let decodeData = try decoder.decode(Resident.self, from: data)
                callback(decodeData.name, nil)
            }
        }
        catch {
            print("критическая ошибка Json \(String(describing: String(data: data, encoding: .utf8)))")
        }
    }
    
}
