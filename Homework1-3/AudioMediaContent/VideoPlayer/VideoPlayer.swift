//
//  VideoPlayer.swift
//  Homework1-3
//
//  Created by qwerty on 20.06.2022.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoPlayer: UIViewController {
   
    let coordinator: VideoPlayerCoordinator
    var videoArray: [(name: String, url: URL)] = []
    
    lazy var videoTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.toAutoLayout()
        table.refreshControl = UIRefreshControl()
        table.isScrollEnabled = true
        table.separatorInset = .zero
        table.refreshControl?.addTarget(self, action: #selector(updateVideoArray), for: .valueChanged)
        table.rowHeight = UITableView.automaticDimension
        
        return table
    }()
    
    init(coordinator: VideoPlayerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        fillLibrary()
        
        videoTable.dataSource = self
        videoTable.delegate = self
        
        videoTable.register(VideoPlayerCell.self, forCellReuseIdentifier: VideoPlayerCell.identifire)

        view.addSubview(videoTable)
        
        useConstraint()
        
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([videoTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     videoTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     videoTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     videoTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func fillLibrary() {
        videoArray.removeAll()
        videoArray.append(("Работа с QR кодом в iOS приложении", URL(fileURLWithPath: "https://www.youtube.com/results?search_query=ios+программа+кодом")))
        videoArray.append(("iOS Стэнфордский курс. Swift. Объяснение на русском. Лекция 1", URL(fileURLWithPath: "https://www.youtube.com/watch?v=oijO3KKbvPw&t=1638s")))
        videoArray.append(("Пишем приложение «Погода» для iOS за 1 час", URL(fileURLWithPath: "https://www.youtube.com/watch?v=Ykyia6eMQk8&t=867s")))
        videoArray.append(("С чего начать и как развиваться в iOS-разработке?»", URL(fileURLWithPath: "https://www.youtube.com/watch?v=3SvKIQYHDDs")))
        videoArray.append(("iOS Code Signing || Как подписать код в iOS", URL(fileURLWithPath: "https://www.youtube.com/watch?v=zZ8HfAYadAI&t=289s")))
    }
                                                                                                  
    @objc func updateVideoArray() {
        videoTable.reloadData()
        videoTable.refreshControl?.endRefreshing()
    }
    
}

extension VideoPlayer: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.videoArray.count

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoPlayerCell.identifire, for: indexPath) as! VideoPlayerCell
        cell.specifyFields(name: videoArray[indexPath.row].name, url: videoArray[indexPath.row].url)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = videoArray[indexPath.row].url
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true) {
            player.play()
        }
    }
    
}
