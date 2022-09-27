//
//  PhotosTableViewCell.swift
//  Homework1-3
//
//  Created by qwerty on 22.03.2022.
//

import UIKit
import iOSIntPackage

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    
    let imageProcessorMain = ImageProcessor()
    
    
    let title: UILabel = {
        let title = UILabel()
        title.text = LocalizableService.getText(key: .photos)
        title.textColor = .black
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.toAutoLayout()
        return title
    }()
    
    let nextButtonImage: UIImageView = {
        let nextButtonImage = UIImageView()
        nextButtonImage.toAutoLayout()
        nextButtonImage.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return nextButtonImage
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(title, nextButtonImage, stackView)
        
        
        
        for i in 0...3 {
            
            let myPhotos = UIImageView(image: photosGaleryArray[i])
            myPhotos.toAutoLayout()
            myPhotos.layer.cornerRadius = 6
            myPhotos.clipsToBounds = true
            stackView.addArrangedSubview(myPhotos)
        }
        
        initialLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialLayout(){
        
        NSLayoutConstraint.activate([title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                                     title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                                     
                                     nextButtonImage.centerYAnchor.constraint(equalTo: title.centerYAnchor),
                                     nextButtonImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                                     nextButtonImage.heightAnchor.constraint(equalToConstant: 30),
                                     nextButtonImage.widthAnchor.constraint(equalToConstant: 30),
                                     
                                     stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
                                     stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12),
                                    ])
        
        stackView.arrangedSubviews.forEach(
            {
                [$0.widthAnchor.constraint(greaterThanOrEqualToConstant: (stackView.frame.width - 16) / 4),
                 $0.heightAnchor.constraint(equalTo: $0.widthAnchor)].forEach({$0.isActive = true})
            })
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
