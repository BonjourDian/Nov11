//
//  CategoryViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 13/11/2021.
//

import Foundation

class CategoryViewModel: NSObject {
    
    private var categoryApiService: CategoryApiService!
    
    private(set) var categoriesData : [Category] = [] {
        didSet {
            self.bindCategoryViewModelToController()
        }
    }
    
    var bindCategoryViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.categoryApiService =  CategoryApiService()
        callGetCategories()
    }
    
    func callGetCategories() {
        self.categoryApiService.getCategories{(categoriesData) in
            self.categoriesData = categoriesData
        }
    }
    
    func getNameById(_ id: Int64) -> String {
        guard let index = categoriesData.firstIndex(where: { $0.id == id }) else {
            return ""
        }
        return categoriesData[index].name
    }
    
    func getNameList() -> [String] {
        var pickerArray : [String] = []
        for category in categoriesData {
            pickerArray.append(category.name)
        }
        return pickerArray
    }
    
}
