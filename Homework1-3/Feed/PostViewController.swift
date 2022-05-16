
import UIKit

struct PostMain {
    var title: String
    var image: UIImage
    var info: String
}

class PostViewController: UIViewController {
    
    var post: PostMain
    
    init(post: PostMain) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let infoBarButtonItem = UIBarButtonItem(title: "ИНФО", style: .plain, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItem  = infoBarButtonItem
        
        view.backgroundColor = UIColor.lightGray
        
        title = post.title
        
        let image = UIImageView(image: post.image)
        image.toAutoLayout()
        image.contentMode = .scaleAspectFit
        
        view.addSubview(image)
        
        NSLayoutConstraint.activate([image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     image.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
    }
    
    @objc func showInfo() {
        let infoViewController = InfoViewController(title: post.info)
        present(infoViewController, animated: true, completion: nil)
    }
    
}
