//
//  CategorieMockService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


class CategorieMockService: CategorieService {

    
    private let categories: [Categorie] = [
        Categorie(id:1,name:"Véhicule"),
        Categorie(id:2,name:"Mode"),
        Categorie(id:3,name:"Bricolage")
    ]
    
    func getCategories(completion: @escaping ([Categorie]) -> Void) {
        completion(self.categories)
    }
    
    func getById(_ id: String, completion: @escaping (Categorie?) -> Void) {
        
    }
  
}

