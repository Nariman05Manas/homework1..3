//
//  buyFullVersion.swift
//  Homework1-3
//
//  Created by qwerty on 03.06.2022.
//

import Foundation
import UIKit

class BuyFullVersion: UIViewController {
    
    lazy var reclame: UILabel = {
        let textView = UILabel()
        textView.toAutoLayout()
        textView.textColor = .black
        textView.text = "Выберите способ оплаты"
        textView.textAlignment = .center
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(reclame)
        
        NSLayoutConstraint.activate([reclame.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                                     reclame.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Const.leadingMargin),
                                     reclame.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Const.trailingMargin),
                                     reclame.heightAnchor.constraint(equalToConstant: 20)
                                    ])
        
    }
    
}
