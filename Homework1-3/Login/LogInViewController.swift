//
//  LogInViewController.swift
//  Homework1-3
//
//  Created by qwerty on 09.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate  {
    
    var delegate: LoginViewControllerDelegate?
    var handleLogin: (_ authenticationData: (userService: UserService, name: String)) -> Void
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.toAutoLayout()
        return contentView
    }()
    
    lazy var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.toAutoLayout()
        return logo
    }()
    
    lazy var userName: UITextField = {
        let userName = UITextField()
        userName.toAutoLayout()
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userName.tintColor = UIColor(named: "AccentColor")
        userName.autocapitalizationType = .none
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.borderWidth = 0.25
        userName.placeholder = LocalizableService.getText(key: .emailOrPhone)
        userName.keyboardType = .emailAddress
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        userName.returnKeyType = .done
        userName.addTarget(self, action: #selector(editingEnded), for: .editingChanged)
        return userName
    }()
    
    lazy var password: UITextField = {
        let password = UITextField()
        password.toAutoLayout()
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.tintColor = UIColor(named: "AccentColor")
        password.autocapitalizationType = .none
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.25
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.placeholder = LocalizableService.getText(key: .password)
        password.returnKeyType = UIReturnKeyType.default
        password.addTarget(self, action: #selector(editingEnded), for: .editingChanged)
        return password
    }()
    
    lazy var logIn: UIButton = {
        let logIn = UIButton()
        logIn.toAutoLayout()
        logIn.layer.cornerRadius = 10
        logIn.clipsToBounds = true
        logIn.setTitle(LocalizableService.getText(key: .enter), for: .normal)
        logIn.titleLabel?.textColor = .white
        logIn.layer.shadowColor = UIColor.black.cgColor
        logIn.layer.shadowOffset = CGSize(width: 4, height: 4)
        logIn.layer.shadowOpacity = 0.7
        logIn.layer.shadowRadius = 4
        logIn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        logIn.isEnabled = false
        
        if let image = UIImage(named: "blue_pixel") {
            logIn.imageView?.contentMode = .scaleAspectFill
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 1), for: .normal)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.6), for: .selected)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.6), for: .highlighted)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.2), for: .disabled)
        }
        return logIn
    }()
    
    lazy var regIn: UIButton = {
        let regIn = UIButton()
        regIn.toAutoLayout()
        regIn.layer.cornerRadius = 10
        regIn.clipsToBounds = true
        regIn.setTitle(LocalizableService.getText(key: .registration), for: .normal)
        regIn.titleLabel?.textColor = .white
        regIn.layer.shadowColor = UIColor.black.cgColor
        regIn.layer.shadowOffset = CGSize(width: 4, height: 4)
        regIn.layer.shadowOpacity = 0.7
        regIn.layer.shadowRadius = 4
        regIn.addTarget(self, action: #selector(registerIn), for: .touchUpInside)
        regIn.isEnabled = false
        
        if let image = UIImage(named: "blue_pixel") {
            regIn.imageView?.contentMode = .scaleAspectFill
            regIn.setBackgroundImage(image.imageWithAlpha(alpha: 1), for: .normal)
            regIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.6), for: .selected)
            regIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.6), for: .highlighted)
            regIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.2), for: .disabled)
        }
        return regIn
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        return stackView
    }()
    
    var queue: DispatchQueue? = nil
    
    init(callback: @escaping (_ authenticationData: (userService: UserService, name: String)) -> Void) {
        self.handleLogin = callback
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        
        contentView.addSubviews(logo, stackView, logIn, regIn)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        useConstraint()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
        
#if release
        userName.text = ""
#elseif DEBUG
        userName.text = "nariman05@mail.ru"
#endif
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        if let delegate = delegate {
            _ = delegate.checkUserToDataBase { [weak self] user in
                self?.userName.text = user.name
                DispatchQueue.main.async {
                    self?.logined()
                }
            }
        }
   
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    private func useConstraint() {
        
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                     contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     
                                     logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.bigIndent),
                                     logo.widthAnchor.constraint(equalToConstant: Const.bigSize),
                                     logo.heightAnchor.constraint(equalToConstant: Const.bigSize),
                                     logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: Const.bigIndent),
                                     stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
                                     stackView.heightAnchor.constraint(equalToConstant: Const.bigSize),
                                     
                                     logIn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: Const.indent),
                                     logIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
                                     logIn.widthAnchor.constraint(equalToConstant: view.frame.width / 2 -  Const.leadingMargin),
                                     logIn.heightAnchor.constraint(equalToConstant: Const.size),
                                     
                                     regIn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: Const.indent),
                                     regIn.leadingAnchor.constraint(equalTo: logIn.trailingAnchor, constant: Const.leadingMargin),
                                     regIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
                                     regIn.heightAnchor.constraint(equalToConstant: Const.size)])
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardRectangle = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardRectangle.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRectangle.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc func tap() {
        password.resignFirstResponder()
        userName.resignFirstResponder()
    }
    
    @objc func editingEnded() {
        regIn.isEnabled = self.userName.text != "" && self.password.text != ""
        logIn.isEnabled = regIn.isEnabled
    }
    
    func logined() {
        let userService = CurrentUserService(name: userName.text ?? "", avatar: "gend", status: "ты не пройдешь!")
        handleLogin((userService: userService, name: userName.text ?? ""))
    }
    
    @objc func signIn() {
        if let delegate = delegate {
            let userName = self.userName.text ?? ""
            let password = self.password.text ?? ""
            
            DispatchQueue.global().async {
                delegate.signIn(login: userName, password: password) { (result, message) in
                    switch result {
                    case .success(true) :
                        DispatchQueue.main.async {
                            self.logined()
                        }
                    case .success(false):
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Ошибка авторизации", message: message, preferredStyle: .alert)
                            let action = UIAlertAction(title: LocalizableService.getText(key: .agree), style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true, completion: nil)
                        }
                        
                    case .failure(.unauthorized):
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Ошибка авторизации", message: message, preferredStyle: .alert)
                            let action = UIAlertAction(title: LocalizableService.getText(key: .agree), style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    default:
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Ошибка авторизации", message: "Критическая ошибка ,возможно поможет перезагрузка", preferredStyle: .alert)
                            let action = UIAlertAction(title: LocalizableService.getText(key: .agree), style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true) { fatalError() }
                            
                        }
                    }
                }
            }
        }
    }
    
    @objc func registerIn() {
        
        if let delegate = delegate {
            let userName = self.userName.text ?? ""
            let password = self.password.text ?? ""
            
            DispatchQueue.global().async {
                delegate.registerIn(login: userName, password: password) { result, message in
                    switch result {
                    case .success(true) :
                        DispatchQueue.main.async {
                            self.logined()
                        }
                    case .success(false):
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "произошла ошибка при авторизации", message: message, preferredStyle: .alert)
                            let action = UIAlertAction(title: LocalizableService.getText(key: .agree), style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true, completion: nil)
                        }
                        
                    case .failure(.unauthorized):
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Упс при авторизации что то пошло не так", message: message, preferredStyle: .alert)
                            let action = UIAlertAction(title: LocalizableService.getText(key: .agree), style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    default:
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "При авторизации что то пошло не так", message: "попробуйте перезайти в программу!", preferredStyle: .alert)
                            let action = UIAlertAction(title: "ок", style: .default, handler: nil)
                            alertController.addAction(action)
                            self.present(alertController, animated: true) { fatalError() }
                            
                        }
                    }
                }
            }
        }
    }
    
}

extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

