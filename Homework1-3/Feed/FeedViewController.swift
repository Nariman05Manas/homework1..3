
import UIKit

class FeedViewController: UIViewController {
    
    let model: FeedModel = FeedModel()
    
    lazy var stackView: UIStackView = {
        
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment = .fill
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var questionsStackView: UIStackView = {
        
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment = .fill
        stack.backgroundColor = .clear
        return stack
    }()
    
    lazy var firstButton: CustomButton = {
        let button = CustomButton(vc: self,
                                  text: "",
                                  backgroundColor: .clear,
                                  backgroundImage: UIImage(named: "gend2"),
                                  tag: 0,
                                  shadow: true) {
            (vc: UIViewController, sender: CustomButton) in
            self.showPost(sender: sender)
            
        }
        
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button =  CustomButton(vc: self,
                                   text: "",
                                   backgroundColor: .clear,
                                   backgroundImage: UIImage(named: "gend1"),
                                   tag: 1,
                                   shadow: true) {
            (vc: UIViewController, sender: CustomButton) in
            self.showPost(sender: sender)
            
        }
        button.layer.cornerRadius = 4
        
        return button
    }()
    
    lazy var answerTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Зеленый"
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 15))
        textField.leftViewMode = .always
        return textField
    }()
    
   
    
    lazy var answerButton: CustomButton = {
        let button = CustomButton(vc: self,
                                  text: "Проверить текст",
                                  backgroundColor: .blue,
                                  backgroundImage: nil,
                                  tag: 0,
                                  shadow: true) {
            (vc:UIViewController, sender: CustomButton) in
            if self.model.check(word: self.answerTextField.text!) {
                sender.notification = {sender.textFieldArray.forEach({$0.textColor = UIColor.green})}
            }
            else {
                sender.notification = {sender.textFieldArray.forEach({$0.textColor = UIColor.red})}
            }
        }
        
        button.layer.cornerRadius = 4
        button.addTextField(textField: answerTextField)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
        questionsStackView.addArrangedSubview(answerTextField)
        questionsStackView.addArrangedSubview(answerButton)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(questionsStackView)
        
        view.addSubview(stackView)
        useConstraint()
        
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: Const.trailingMargin),
                                     stackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 1.5)])
    }
    func showPost(sender: UIButton) {
        let postViewController = PostViewController(post:PostMain(title: sender.title(for: .normal)!,
                                                                  image: sender.image(for: .normal)!,
                                                                  info: infoArray[sender.tag]))
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    
}

