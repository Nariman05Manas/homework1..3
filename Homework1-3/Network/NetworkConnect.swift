//
//  NetworkConnect.swift
//  Homework1-3
//
//  Created by qwerty on 21.06.2022.
//

import Foundation
import UIKit

enum NetworkConfiguration: String, CaseIterable {
    case firstApi = "https://swapi.dev/api/people/8"
    case secondApi = "https://swapi.dev/api/starships/3"
    case threedApi = "https://swapi.dev/api/planets/5"
}

struct NetworkService {
    static func startNetwork(url: String) {
        if let url = URL(string: url) {
            
            let task = URLSession.shared.dataTask(with: url) { data, responce, error in
                if let data = data, let responce = responce as? HTTPURLResponse
                {
                    print(" 🦊 data: \(String(data: data, encoding: .utf8) ?? "No data!")")
                    print(" 🐻allHeaderFields: \(responce.allHeaderFields)")
                    print(" 🦁 statusCode: \(responce.statusCode)")
                    
                } else if let error = error {
                    print(" 🚨 No network error !check your network connection!: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        }
    }
    
}
