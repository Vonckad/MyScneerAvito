//
//  MyCollectionViewCell.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/17/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    var image: CustomImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var priceLabel: UILabel!
    var currentCellSelectedImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image = CustomImageView.init(frame: frame)
        titleLabel = UILabel(frame: frame)
        descriptionLabel = UILabel(frame: frame)
        priceLabel = UILabel(frame: frame)
        currentCellSelectedImage = UIImageView(frame: frame)
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(currentCellSelectedImage)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame.size = CGSize(width: 100, height: 100)
        image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        

        titleLabel.rightAnchor.constraint(equalTo: currentCellSelectedImage.leftAnchor, constant: -20).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
           
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -20).isActive = true
        priceLabel.font = UIFont.boldSystemFont(ofSize: 24)

        currentCellSelectedImage.translatesAutoresizingMaskIntoConstraints = false
        currentCellSelectedImage.frame.size = CGSize(width: 80, height: 80)
        currentCellSelectedImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        currentCellSelectedImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
