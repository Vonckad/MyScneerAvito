//
//  ViewController.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/13/21.
//

import UIKit

protocol MainViewProtocol {
    
    func setTextMainLabel(text: String)
    var coutnCell: Int { get set }
    func setTitleButton(text: String)
    var selectedCell: String { get set }
    var selCell: Bool {get set}
    var setSelectedCell: IndexPath {get}
}

class ViewController: UIViewController, MainViewProtocol {
    
    var coutnCell: Int = 0
    
    var selectedCell: String = ""
    var selCell: Bool = false
    var setSelectedCell: IndexPath = .init(row: 0, section: 0)
    
    var closeButtonView = UIImageView()
    var mainLabel = UILabel()
    var chooseButton = UIButton()
    var myCollectionView: UICollectionView!
    
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createCloseButtonView()
        createMainLabel()
        createMyCollectionView()
        createChooseButton()

        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func setTextMainLabel(text: String) {
        mainLabel.font = UIFont.boldSystemFont(ofSize: 34)
        mainLabel.numberOfLines = 0
        mainLabel.text = text
    }
    
    func setTitleButton(text: String){
        chooseButton.setTitle(text, for: .normal)
    }
    
    func createCloseButtonView() {
        
        closeButtonView.translatesAutoresizingMaskIntoConstraints = false
        closeButtonView.image = UIImage(named: "x")
        view.addSubview(closeButtonView)
        
        closeButtonView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        closeButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    }
    
    func createMainLabel() {

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLabel)

        mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mainLabel.topAnchor.constraint(equalTo: closeButtonView.bottomAnchor, constant: 40).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func createMyCollectionView() {

        let layout = UICollectionViewFlowLayout()
        myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 374, height: view.frame.height / 4)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.backgroundColor = .systemBackground
        myCollectionView.layer.cornerRadius = 10
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(myCollectionView)
        
        myCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        myCollectionView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 40).isActive = true
        myCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func createChooseButton() {

        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.setTitle("Выбрать", for: .normal)
        chooseButton.titleLabel?.textColor = .white
        chooseButton.backgroundColor = UIColor.init(red: 57/255, green: 172/255, blue: 251/255, alpha: 1.0)
        chooseButton.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        chooseButton.layer.cornerRadius = 10
        view.addSubview(chooseButton)
        
        chooseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        chooseButton.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 20).isActive = true
        chooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        chooseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return coutnCell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        cell.image.loadImageUsingUrlStrting(urlString: presenter.setImageForCell(index: indexPath))
        cell.image.contentMode = .scaleAspectFit
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = presenter.setTitleForCell(index: indexPath)
        cell.descriptionLabel.numberOfLines = 0
        cell.descriptionLabel.text = presenter.setDescriptionForCell(index: indexPath)
        cell.priceLabel.text = presenter.setPriceForCell(index: indexPath)
        cell.currentCellSelectedImage.layer.cornerRadius = 13
        cell.currentCellSelectedImage.backgroundColor = UIColor.init(red: 57/255, green: 172/255, blue: 251/255, alpha: 1.0)
        cell.currentCellSelectedImage.image = UIImage(named: "mark")
        
//        cell.currentCellSelectedImage.isHidden = true
        cell.currentCellSelectedImage.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        if let cell = (myCollectionView.cellForItem(at: indexPath) as? MyCollectionViewCell) {
            selCell = true
        cell.currentCellSelectedImage.isHidden = true
        }
//        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        if let cell = (myCollectionView.cellForItem(at: indexPath) as? MyCollectionViewCell) {
            if cell.currentCellSelectedImage.isHidden == true {
                selCell = false
                setSelectedCell = indexPath
                cell.currentCellSelectedImage.isHidden = false
            } else {
                selCell = true
                setSelectedCell = indexPath
                cell.currentCellSelectedImage.isHidden = true
            }
        }
        
        selectedCell = String(indexPath.section)
        print("presenter.titleButton1() === ", presenter.titleButton1())
        setTitleButton(text: presenter.reloadTitleForButton())
        
    }
}
