//
//  PhotosViewController.swift
//  Homework1-3
//
//  Created by qwerty on 22.03.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imagePublisherFacade = ImagePublisherFacade()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .vertical
        layout.collectionView?.toAutoLayout()
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.toAutoLayout()
        return collectionView
    }()
    
    var contentPhotoDataArray: [UIImage] = []
    var timerCount = 0.0
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фото галлерея"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        useConstraint()
        
        
       
      let imageProcessor = ImageProcessor()
        imageProcessor.processImagesOnThread(sourceImages: photosGaleryArray, filter: .sepia(intensity: 0.5), qos: .default) {cgImages in
            let images = cgImages.map({UIImage(cgImage: $0!)})
            self.contentPhotoDataArray.removeAll()
            images.forEach({self.contentPhotoDataArray.append($0)})
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    //Фукц вычесления времени
    @objc func updateTimer() {
        timerCount += 0.01
        if contentPhotoDataArray.count > 0 {
            print("\(self.timerCount) секунд")
            timer!.invalidate()
            
            /*----------------------------------------------------------------------------------------------
             время исполнения для каждого вызова метода processImagesOnThread с разной комбинацией параметров
             .userInteractive - 1.17 сек
             .utility - 0.92 сек
             .background - 1.33 сек
             .userInitiated - 0.8 сек
             .default - 0.9
             ------------------------------------------------------------------------------------------------
             */
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func useConstraint() {
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentPhotoDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        cell.initialImages(contentPhotoDataArray[indexPath.item])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 40) / 3, height: (collectionView.frame.width - 40) / 3)
    }
}


