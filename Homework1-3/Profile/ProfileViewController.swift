
import UIKit

class ProfileViewController: UIViewController {
    
    let newButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        title = "мой профиль"
        let profileHeaderView = ProfileHeaderView()
        view.addSubview(profileHeaderView)
        profileHeaderView.initialSubviews()
        
        self.view.backgroundColor = .lightGray
        
        newButton.toAutoLayout()
        newButton.layer.cornerRadius = 5
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("Установить статус", for: .normal)
        newButton.addTarget(self, action: #selector(setTitle), for: .touchUpInside)
        self.view.addSubview(newButton)
        
        newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //MARK: Initial title
    @objc func setTitle() {
        if title == "Новый статус"{
            title = "ты не пройдешь!"
        } else {
            title = "без статуса!"
        }
    }
}


