
import UIKit


class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var userName: UILabel = {
        let userName = UILabel()
        userName.toAutoLayout()
        userName.text = "GENDALE"
        userName.textAlignment = .natural
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return userName
    }()
    
   lazy var avatar: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "gend"))
        avatar.toAutoLayout()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
       let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.openAvatar))
       avatar.addGestureRecognizer(recognizer)
       avatar.isUserInteractionEnabled = true
       return avatar
    }()
    
    var status: UILabel = {
        let status = UILabel()
        status.toAutoLayout()
        status.text = "ты не пройдешь!!!"
        status.textAlignment = .natural
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.isUserInteractionEnabled = true
        return status
    }()
    
    var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.toAutoLayout()
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        statusButton.setTitle("Установить статус", for: .normal)
        statusButton.setTitleColor(.white, for: .highlighted)
        statusButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return statusButton
    }()
    
    var setStatusField: UITextField = {
        let setStatusField = UITextField()
        setStatusField.toAutoLayout()
        setStatusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setStatusField.placeholder = "Ввести статус"
        setStatusField.textColor = .black
        setStatusField.backgroundColor = .white
        setStatusField.textAlignment = .natural
        setStatusField.layer.cornerRadius = 12
        setStatusField.layer.borderWidth = 1
        setStatusField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        setStatusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setStatusField.frame.height))
        setStatusField.leftViewMode = .always
        setStatusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return setStatusField
    }()
    lazy var foneView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.toAutoLayout()
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    var closeButton: UIButton = {
             let button = UIButton()
             button.isHidden = true
             button.toAutoLayout()
             button.imageView?.contentMode = .scaleAspectFit
             button.backgroundColor = .darkGray
             button.setImage(UIImage(systemName: "xmark"), for: .normal)
             button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
             return button
         }()
    
    private var defaultAvatarPosicion: CGPoint?
    private var statusText = ""
    static let identifire = "ProfileHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(userName, status, statusButton, setStatusField, foneView, avatar, closeButton)
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openAvatar() {
        UIImageView.animate(
            withDuration: 0.5,
            animations: {
                self.defaultAvatarPosicion = self.avatar.center
                self.avatar.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                self.avatar.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatar.frame.width,
                                                          y: self.contentView.frame.width / self.avatar.frame.width)
                self.avatar.layer.cornerRadius = 0
                self.foneView.isHidden = false
                self.foneView.alpha = 0.7
                self.avatar.isUserInteractionEnabled = false
            },
            completion: { _ in
                UIImageView.animate(withDuration: 0.3) {
                    self.closeButton.isHidden = false
                    self.closeButton.alpha = 1
                }
            })
    }
    
    @objc func closeAvatar() {
        UIImageView.animate(
            withDuration: 0.3,
            animations: {
                self.closeButton.alpha = 0
                self.closeButton.isHidden = true
                
            },
            completion: { _ in
                UIImageView.animate(withDuration: 0.5,
                                    animations: {
                    self.avatar.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.avatar.layer.cornerRadius = self.avatar.frame.width / 2
                    self.avatar.center = self.defaultAvatarPosicion!
                    self.foneView.alpha = 0.0
                    self.avatar.isUserInteractionEnabled = true
                   
                },
                                    completion: { _ in
                    self.foneView.isHidden = true
                })
            })
        
    }
    
    @objc func doNothing() {
        
    }
    @objc func pressButton() {
        status.text = statusText
        statusText = ""
        setStatusField.text = ""
        setStatusField.resignFirstResponder()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }
    
    private func useConstraint() {
        
         [avatar.widthAnchor.constraint(equalToConstant: 100),
         avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor),
         avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
         avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
         
         userName.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
         userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
         userName.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: Const.trailingMargin),
         
         status.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
         status.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: Const.trailingMargin),
         status.bottomAnchor.constraint(equalTo: setStatusField.topAnchor, constant: -6),
         
         statusButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
         statusButton.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: Const.trailingMargin),
         statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: Const.indent),
         statusButton.heightAnchor.constraint(equalToConstant: 50),
         
         setStatusField.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
         setStatusField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
         setStatusField.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: Const.trailingMargin),
         setStatusField.heightAnchor.constraint(equalToConstant: 40)].forEach({$0.isActive = true})
        
    }
    
}
