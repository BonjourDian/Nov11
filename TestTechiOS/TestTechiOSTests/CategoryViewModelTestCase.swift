//
//  CategoryViewModelTestCase.swift
//  TestTechiOSTests
//
//  Created by DIAN on 16/11/2021.
//

import XCTest
@testable import TestTechiOS

class CategoryViewModelTestCase: XCTestCase {
    
    var categoryViewModel: CategoryViewModel!
    
    let testCategories = [
        Category(id:1,name:"Véhicule"),
        Category(id:2,name:"Mode"),
        Category(id:3,name:"Bricolage")
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        categoryViewModel = CategoryViewModel()
        categoryViewModel.isTesting = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCallGetCategories() throws {
        XCTAssert(categoryViewModel.categoriesData == [])
        
        categoryViewModel.callGetCategories()
        
        XCTAssert(categoryViewModel.categoriesData == testCategories)
    }
    
    func testGetNameById() throws {
        categoryViewModel.callGetCategories()
        let categoryId: Int64 = 2
        
        let resultName = categoryViewModel.getNameById(categoryId)
        
        XCTAssert(resultName == "Mode")
    }
    
    func testGetNameList() throws {
        categoryViewModel.callGetCategories()
        
        let resultList: [String] = categoryViewModel.getNameList()
        
        XCTAssert(resultList == ["Véhicule", "Mode", "Bricolage"])
    }

}
