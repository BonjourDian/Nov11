//
//  CategoriesServiceProtocol.swift
//  TestTechiOS
//
//  Created by DIAN on 27/11/2021.
//

protocol CategoriesServiceProtocol {
    func getCategories(completion: @escaping ([Category]) -> Void)
    func getById(_ id: String, completion: @escaping (Category?) -> Void)
}
