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

    func setTitleForCell(index: IndexPath) -> String
    func setDescriptionForCell(index: IndexPath) -> String
    func setPriceForCell(index: IndexPath) -> String
    func setImageForCell(index: IndexPath) -> String
    func setChekmark() -> Bool
    func reloadTitleForButton() -> String
    func titleButton1() -> String
    var titleButton: String {get}
    
}

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
//    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func setTitleForCell(index: IndexPath) -> String {
        return interactor.getTitleForCell(index: index)
    }
    
    func setDescriptionForCell(index: IndexPath) -> String {
        return interactor.getDescriptoinForCell(index: index)
    }
    
    func setPriceForCell(index: IndexPath) -> String {
        return interactor.getPriceForCell(index: index)
    }
    
    func setImageForCell(index: IndexPath) -> String {
        return interactor.getImageForCell(index: index)
    }
    
    func setChekmark() -> Bool {
        return view.selCell
    }
    
    func titleButton1() -> String {
        return interactor.chengeButtomTitle()
    }
    
    var titleButton: String {
        get {
            return view.selectedCell
        }
    }
    
    func reloadTitleForButton() -> String {
        return interactor.titleButton
    }
    
    func configureView() {
        interactor.getAllCurrencies()
        view.setTextMainLabel(text: interactor.title)
        view.coutnCell = interactor.count
        view.setTitleButton(text: interactor.titleButton)
        view.selCell = interactor.isSelected(index: view.setSelectedCell)
    }
}

