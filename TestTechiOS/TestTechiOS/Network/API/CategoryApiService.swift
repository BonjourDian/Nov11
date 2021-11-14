//
//  CategoryApiService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import Foundation

class CategoryApiService: CategoryService {
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, res, err) in
            DispatchQueue.main.sync {
                guard let d = data,let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] else {
                    completion([])
                    return
                }
                completion(json.compactMap(CategoryFactory.categoryWith(dictionary:)))
              //  print(json)
            }
        }.resume()
    }
    
    func getById(_ id: String, completion: @escaping (Category?) -> Void) {
        completion(nil)
    }
    
    
}
