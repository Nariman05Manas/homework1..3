
import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {
    
    var infoViewController: InfoViewController
    
    init() {
        infoViewController = InfoViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemMint
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ВХОД", style: .plain, target: self, action: #selector(addTapped))
        
    }
    //метод
    @objc func addTapped() {
        present(infoViewController, animated: true, completion: nil)
        
    }
    
    
}
