//
//  CategorieFactory.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


class CategorieFactory {
    
    static func CategorieWith(dictionary: [String: Any]) -> Categorie? {
        guard
     
            let id = dictionary["id"] as? Int64,
            let name = dictionary["name"] as? String
        else {
                return nil
        }
        
        return Categorie(id: id,name:name)
    }
    
}

