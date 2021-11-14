//
//  CategoryService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


protocol CategoryService{
    func getCategories(completion: @escaping ([Category]) -> Void)
    func getById(_ id: String, completion: @escaping (Category?) -> Void)
}

