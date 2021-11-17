//
//  CategoryMockService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


class CategoryMockService: CategoryService {
/// Cette classe est utilisée pour les tests unitaires.
/// Elle simule une API en envoyant une liste de catégories
    
    private let categories: [Category] = [
        Category(id:1,name:"Véhicule"),
        Category(id:2,name:"Mode"),
        Category(id:3,name:"Bricolage")
    ]
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        completion(self.categories)
    }
    
    func getById(_ id: String, completion: @escaping (Category?) -> Void) {
        
    }
  
}

