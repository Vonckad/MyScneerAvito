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
    var count: Int {get}
    
    
    
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
            return myAvitoData.result.actionTitle
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
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getAllCurrencies() {
        
        serverService.loadWeather { (dist) in
            self.myAvitoData = dist
        }
    }
}
