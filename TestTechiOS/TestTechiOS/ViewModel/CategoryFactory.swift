//
//  CategoryFactory.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


class CategoryFactory {
    
    static func categoryWith(dictionary: [String: Any]) -> Category? {
        guard
            let id = dictionary["id"] as? Int64,
            let name = dictionary["name"] as? String
        else {
                return nil
        }
        
        return Category(id: id,name:name)
    }
    
}

