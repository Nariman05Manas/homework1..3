
import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой профиль"
        let profileHeaderView = ProfileHeaderView()
        view.addSubview(profileHeaderView)

         profileHeaderView.setupView()

         let titleButton = UIButton()
         titleButton.translatesAutoresizingMaskIntoConstraints = false
         titleButton.backgroundColor = .blue
         titleButton.setTitle("Установить новый профиль", for: .normal)
         titleButton.setTitleColor(.white, for: .highlighted)
         titleButton.addTarget(self, action: #selector(setNewTitle), for: .touchUpInside)

         view.addSubview(titleButton)

         titleButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
         titleButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         titleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
         titleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

     }
    @objc func setNewTitle() {
         if title == "Профиль" {
             title = "попробуй пройти"
         } else {
             title = "Профиль"
         }
     }

 }
    

