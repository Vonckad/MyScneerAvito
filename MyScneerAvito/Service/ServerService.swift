//
//  ServerService.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/13/21.
//

import Foundation
import UIKit

protocol ServerServiceProtocol: class {

    func loadWeather(completion: @escaping (RootModel) -> Void)
    func getImage(link: String) -> UIImage
}

class ServerService: ServerServiceProtocol {
       
    var myImage = UIImage()
    
    func loadWeather(completion: @escaping (RootModel) -> Void) {
        
        if let url = Bundle.main.url(forResource: "avito", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RootModel.self, from: data)
                completion(jsonData)
                print("JSON STATUS === ", jsonData.status)
            }
            catch {
                print("ERROR === ", error)
            }
        }
    }
    
    func getImage(link: String) -> UIImage {
        
        
        DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: URL(string: link)!) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.myImage = image
                            }
                        }
                    }
                }
        return myImage
    }
}
