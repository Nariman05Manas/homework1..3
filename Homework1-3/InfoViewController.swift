//
//  InfoViewController.swift
//  Navigation
//
//  Created by Shom on 10.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let secondButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        secondButton.center = self.view.center
        secondButton.backgroundColor = .magenta
        secondButton.setTitle("УВЕДОМЛЕНИЕ", for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        secondButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        self.view.addSubview(secondButton)
        
    }
    
    @objc func showAlert() {
        
        let alert = UIAlertController(title: "ВНИМАНИЕ!", message: "ГОТОВЫ ПЕРЕЙТИ НА СТРАНИЦУ", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.default, handler: { _ in
            print("БЕЗУСЛОВНО ГОТОВ!")
        }))
        alert.addAction(UIAlertAction(title: "Нет",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
            print("НЕТ НЕ ГОТОВ!")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
