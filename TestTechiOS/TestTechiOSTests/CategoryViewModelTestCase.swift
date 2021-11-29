//
//  CategoryViewModelTestCase.swift
//  TestTechiOSTests
//
//  Created by DIAN on 16/11/2021.
//

import XCTest
@testable import TestTechiOS

class CategoryViewModelTestCase: XCTestCase {
    
    var categoriesViewModel: CategoriesListViewModel!
    
    let testCategories = [
        Category(id:1,name:"Véhicule"),
        Category(id:2,name:"Mode"),
        Category(id:3,name:"Bricolage")
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let categoriesServiceMock = CategoriesServiceMock()
        categoriesViewModel = CategoriesListViewModel(categoriesServiceMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCallGetCategories() throws {
        
        XCTAssert(categoriesViewModel.categoriesData == testCategories)
    }
 
    func testGetNameById() throws {
        
        let categoryId: Int64 = 2
        
        let resultName = categoriesViewModel.getNameById(categoryId)
        
        XCTAssert(resultName == "Mode")
    }
    
    func testGetNameList() throws {
        let categoriesServiceMock = CategoriesServiceMock()
        let categoriesViewModel = CategoriesListViewModel(categoriesServiceMock)
        categoriesViewModel.callGetCategories()
        
        let resultList: [String] = categoriesViewModel.getNameList()
        
        XCTAssert(resultList == ["Véhicule", "Mode", "Bricolage"])
    }

}
