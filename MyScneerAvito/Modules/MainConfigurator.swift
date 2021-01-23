//
//  MainConfigurator.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/17/21.
//

import Foundation

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: ViewController)
}

class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: ViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)

        viewController.presenter = presenter
        presenter.interactor = interactor

    }
}
