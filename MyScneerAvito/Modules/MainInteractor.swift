//
//  MainInteractor.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/14/21.
//

import Foundation
import UIKit
protocol MainInteractorProtocol: class {
    
    func getAllCurrencies()
    var title: String { get }
    var titleButton: String {get}
    func getTitleForCell(index: IndexPath) -> String
    func getDescriptoinForCell(index: IndexPath) -> String
    func getPriceForCell(index: IndexPath) -> String
    func getImageForCell(index: IndexPath) -> String
    func chengeButtomTitle() -> String
    var count: Int {get}
    func isSelected(index: IndexPath) -> Bool
}

class MainInteractor: MainInteractorProtocol {
       
    var myAvitoData = RootModel()
    
    weak var presenter: MainPresenterProtocol!
    
    let serverService: ServerServiceProtocol = ServerService()

    var title: String {
        get {
            return myAvitoData.result.title
        }
    }
    
    var count: Int {
        get {
            return myAvitoData.result.list.count
        }
    }
    
    var titleButton: String {
        get {
            if presenter.titleButton == "" {
                print("00000 = ", presenter.titleButton)
            return myAvitoData.result.actionTitle
            } else {
                print("11111 = ", presenter.titleButton)
            return myAvitoData.result.selectedActionTitle
            }
        }
    }
    
    func getTitleForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].title
    }
    func getDescriptoinForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].description ?? ""
    }
    func getPriceForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].price
    }
    
    func getImageForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].icon.x52x52
    }
    
    func isSelected(index: IndexPath) -> Bool {
        if myAvitoData.result.list[index.section].isSelected == presenter.setChekmark() {
            myAvitoData.result.list[index.section].isSelected = false
            print("myAvitoData.result.list[index.section].isSelected === ", myAvitoData.result.list[index.section].isSelected)
        } else {
            myAvitoData.result.list[index.section].isSelected = true
        }
        return myAvitoData.result.list[index.section].isSelected
    }
    
    func chengeButtomTitle() -> String {
        if presenter.titleButton != nil {
            print("Что-то там нужно сделать ", presenter.titleButton)
        }
        return presenter.titleButton
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getAllCurrencies() {
        
        serverService.loadWeather { (dist) in
            self.myAvitoData = dist
        }
    }
}
