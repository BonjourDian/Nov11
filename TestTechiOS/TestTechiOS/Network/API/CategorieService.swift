//
//  CategorieService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//


protocol CategorieService{
    func getCategories(completion: @escaping ([Categorie]) -> Void)
    func getById(_ id: String, completion: @escaping (Categorie?) -> Void)
}

