//
//  CategoryViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 13/11/2021.
//

import Foundation

class CategoryViewModel: NSObject {
/// Ce viewmodel récupère la liste des catégories auprès du service API et les met à disposition des vues. Il comporte également des fonctions récupérer les noms de catégories ou une catégorie par son id

// MARK: - Déclaration des variables
    var isTesting: Bool = false
    
    private var categoryService: CategoryService{
        if isTesting {
            return CategoryMockService()
        } else {
            return CategoryApiService()
        }
    }
    
    private(set) var categoriesData : [Category] = [] {
        didSet {
            self.bindCategoryViewModelToController()
        }
    }
    
    var bindCategoryViewModelToController : (() -> ()) = {}

// MARK: - Initialisation du VueModel
    override init() {
        super.init()
        callGetCategories()
    }
    
    func callGetCategories() {
        /// Cette fonction récupère la liste des catégories
        self.categoryService.getCategories{(categoriesData) in
            self.categoriesData = categoriesData
        }
    }
    
    func getNameById(_ id: Int64) -> String {
        /// Cette fonction renvoit le nom d'une catégorie en fonction de son id
        guard let index = categoriesData.firstIndex(where: { $0.id == id }) else {
            return ""
        }
        return categoriesData[index].name
    }
    
    func getNameList() -> [String] {
        /// Cette fonction renvoit la liste des noms de catégories
        var pickerArray : [String] = []
        for category in categoriesData {
            pickerArray.append(category.name)
        }
        return pickerArray
    }
    
}
