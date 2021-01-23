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
        
        createImageCell()
        createTitleLabelCell()
        createDescriptionLabelCell()
        createPriceLabelCell()
        createCurrentCellSelectedImageCell()
    }
    
    fileprivate func createImageCell() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 68).isActive = true
        image.heightAnchor.constraint(equalToConstant: 68).isActive = true
        image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        image.contentMode = .scaleAspectFit
    }
    fileprivate func createTitleLabelCell() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50).isActive = true
        titleLabel.font = .boldSystemFont(ofSize: 24)
    }
    fileprivate func createDescriptionLabelCell() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
    }
    fileprivate func createPriceLabelCell() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        priceLabel.font = .boldSystemFont(ofSize: 24)
    }
    fileprivate func createCurrentCellSelectedImageCell() {
        currentCellSelectedImage.translatesAutoresizingMaskIntoConstraints = false
        currentCellSelectedImage.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        currentCellSelectedImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        currentCellSelectedImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        currentCellSelectedImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        currentCellSelectedImage.layer.cornerRadius = 15
        currentCellSelectedImage.backgroundColor = UIColor.init(red: 57/255, green: 172/255, blue: 251/255, alpha: 1.0)
        currentCellSelectedImage.image = UIImage(named: "mark")
        currentCellSelectedImage.contentMode = .scaleAspectFill
        currentCellSelectedImage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
