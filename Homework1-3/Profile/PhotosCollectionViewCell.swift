//
//  PhotosCollectionViewCell.swift
//  Homework1-3
//
//  Created by qwerty on 22.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "PhotosCollectionViewCell"
    
    let photo: UIImageView = {
        let photo = UIImageView()
        photo.toAutoLayout()
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(photo)
        
        initialLayout()
        
    }
    
    func initialLayout() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialImages(_ image: UIImage) {
        photo.image = image
        
    }
}

