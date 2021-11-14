//
//  ArticleService.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//


protocol ArticleService{
    func getArticles(completion: @escaping ([Article]) -> Void)
    func getById(_ id: String, completion: @escaping (Article?) -> Void)
}
