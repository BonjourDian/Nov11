//
//  ArticlesServiceProtocol.swift
//  TestTechiOS
//
//  Created by DIAN on 27/11/2021.
//

protocol ArticlesServiceProtocol {
    func getArticlesAPI(completion: @escaping ([Article]) -> Void)
    func getById(_ id: String, completion: @escaping (Article?) -> Void)
}
