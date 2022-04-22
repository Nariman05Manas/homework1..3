

import UIKit

class ProfileViewController: UIViewController {
    
    var posts = constPostArray
    
    private let userData: UserService
    private let userName: String
    
    init(userData: UserService, userName: String) {
        self.userData = userData
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.refreshControl = UIRefreshControl()
        tableView.isScrollEnabled = true
        tableView.separatorInset = .zero
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 220
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        
        //Debug and Realese color
        
#if DEBUG
        tableView.backgroundColor = .cyan
#elseif release
        tableView.backgroundColor = .white
#endif
        
        view.addSubviews(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "profile")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photosTableViewCell")
        
        
        
        
        
        
        
        initialLayout()
    }
    
    //Инициализация констрентов
    func initialLayout() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                                    ])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
}



//TableView Deegate and DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return constPostArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
            cell.specifyFields(post: posts[indexPath.row])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "photosTableViewCell", for: indexPath) as! PhotosTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profile") as! ProfileHeaderView
            if let user = userData.userSetup(userName) {
                view.setupUserData(user: user)
            }
            return view
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0
        }
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
    
}

