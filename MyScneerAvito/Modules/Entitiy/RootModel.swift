//
//  RootModel.swift
//  MyScneerAvito
//
//  Created by Vlad Ralovich on 1/14/21.
//

import Foundation

struct RootModel: Codable {
    var status: String = ""
    var result: Result = Result()
}

struct Result: Codable {
    var title: String = ""
    var actionTitle: String = ""
    var selectedActionTitle: String = ""
    var list: [List] = []
}

struct List: Codable {
    var id: String
    var title: String
    var description: String?
    var icon: Icon
    var price: String
    var isSelected: Bool
}

struct Icon: Codable {
    var x52x52: String
    
    private struct DynamicCodingKeys: CodingKey {
       
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {

            let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
            var imageN = ""
        
            for key in container.allKeys {
                let decodedObjectInt = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
                imageN = decodedObjectInt
            }
        x52x52 = imageN
    }
}
