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
    
    var contentPhotoData: [UIImage] = [] {
        didSet{
            if contentPhotoData.count == photosGaleryArray.count {
                imagePublisherFacade.removeSubscription(for: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Фото Галерея"
        view.addSubviews(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photosCollectionViewCell")
        initialLayout()
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.3, repeat: photosGaleryArray.count*10, userImages: photosGaleryArray)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        print("Tab Bar Connect")
    }
    
    
    func initialLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}



extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentPhotoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.initialImages(photosGaleryArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 40) / 3, height: (collectionView.frame.width - 40) / 3)
    }
}
extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        
        images.forEach({ image in
            if contentPhotoData.contains(where: {image == $0}) {
                return
            }
            else {
                contentPhotoData.append(image)
            }
        })
        collectionView.reloadData()
        
    }
    
}
