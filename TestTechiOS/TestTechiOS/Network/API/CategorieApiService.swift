//
//  CategorieApiService.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import Foundation

class CategorieApiService: CategorieService {
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!
    
    func getCategories(completion: @escaping ([Categorie]) -> Void) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, res, err) in
            DispatchQueue.main.sync {
                guard let d = data,let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] else {
                    completion([])
                    return
                }
                completion(json.compactMap(CategorieFactory.CategorieWith(dictionary:)))
              //  print(json)
            }
        }.resume()
    }
    
    func getById(_ id: String, completion: @escaping (Categorie?) -> Void) {
        completion(nil)
    }
    
    
}

