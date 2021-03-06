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
    func getTitleForCell(index: IndexPath) -> String
    func getDescriptoinForCell(index: IndexPath) -> String
    func getPriceForCell(index: IndexPath) -> String
    func getImageForCell(index: IndexPath) -> String
    func getTitleForButtom(isSelectedCell: Bool) -> String
    func showAlert(view: UIViewController, title: String)
    func getTitleForAllert(atIndex: Int) -> String
    func chekIsSelected(cell: MyCollectionViewCell, index: IndexPath, currentIndex: Int, isSelected: Bool) -> MyCollectionViewCell
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
    
    func getTitleForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].title
    }
    func getDescriptoinForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].description ?? myAvitoData.result.list[index.section].title
    }
    func getPriceForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].price
    }
    
    func getImageForCell(index: IndexPath) -> String {
        return myAvitoData.result.list[index.section].icon.x52x52
    }
    
    func getTitleForButtom(isSelectedCell: Bool) -> String {
        return isSelectedCell ? myAvitoData.result.selectedActionTitle : myAvitoData.result.actionTitle
    }
    
    func chekIsSelected(cell: MyCollectionViewCell, index: IndexPath, currentIndex: Int, isSelected: Bool) -> MyCollectionViewCell {
        
        if index.section == currentIndex {
            myAvitoData.result.list[index.section].isSelected = !isSelected
            cell.currentCellSelectedImage.isHidden = !myAvitoData.result.list[currentIndex].isSelected
            
        } else if index.section != currentIndex {
            myAvitoData.result.list[index.section].isSelected = false
            cell.currentCellSelectedImage.isHidden = true
            
        }
//        print("myAvitoData.result.list[\(currentIndex) == \(index.section)].isSelected = ", myAvitoData.result.list[index.section].isSelected)
        return cell
    }
    
    func showAlert(view: UIViewController, title: String) {
        
        let allert = UIAlertController.init(title: title, message: "", preferredStyle: .alert)
        let canceAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        allert.addAction(canceAction)
        view.present(allert, animated: true, completion: nil)
    }
    
    func getTitleForAllert(atIndex: Int) -> String {
        var massage = "Продолжить без изменений?"
        if atIndex >= 0 && myAvitoData.result.list[atIndex].isSelected == true {
        massage = "Вы выбрали:\n\(myAvitoData.result.list[atIndex].title)"
        }
        return massage
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getAllCurrencies() {
        
        serverService.readJson { (dist) in
            self.myAvitoData = dist
        }
    }
}
