//
//  File.swift
//  Homework1-3
//
//  Created by qwerty on 09.03.2022.
//

import UIKit


public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}
