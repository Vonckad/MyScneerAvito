//
//  MainPresenter.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/17/21.
//

import UIKit

protocol MainPresenterProtocol: class {
//    var router: MainRouterProtocol! { set get }
    func configureView()
    func setTitleForButtom(isSelectedCell: Bool) -> String
    func configureCell(cell: inout MyCollectionViewCell, index: IndexPath) -> MyCollectionViewCell
}

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
//    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func setTitleForButtom(isSelectedCell: Bool) -> String {
        return interactor.getTitleForButtom(isSelectedCell: isSelectedCell)
    }
    
    func configureView() {
        
        interactor.getAllCurrencies()
        view.setTextMainLabel(text: interactor.title)
        view.coutnCell = interactor.count
        view.setTitleButton(text: interactor.getTitleForButtom(isSelectedCell: view.isSelectedCell))
    }
    
    func configureCell( cell: inout MyCollectionViewCell, index: IndexPath) -> MyCollectionViewCell {
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        cell.image.loadImageUsingUrlStrting(urlString: interactor.getImageForCell(index: index))
        cell.titleLabel.text = interactor.getTitleForCell(index: index)
        cell.descriptionLabel.text = interactor.getDescriptoinForCell(index: index)
        cell.priceLabel.text = interactor.getPriceForCell(index: index)
        cell = interactor.chekIsSelected(cell: cell, index: index, currentIndex: view.currentIndex, isSelected: view.isSelectedCell)
        return cell
    }
}

