//
//  ArticlesServiceApi.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//

import Foundation

class ArticlesServiceApi: ArticlesServiceProtocol {
/// Ce service fait des requêtes GET sur le site "leboncoin" pour récupérer la liste des articles au format json
/// Les données json sont mises en forme en un modèle Article
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!
    /*
    func getArticlesAPI(completion: @escaping ([Article]) -> Void) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, res, err) in
            DispatchQueue.main.sync {
                guard let d = data,let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] else {
                    completion([])
                    return
                }
                completion(json.compactMap(ArticleFactory.ArticleWith(dictionary:)))
              //  print(json)
            }
        }.resume()
    }
*/
    func getArticlesAPI(completion: @escaping ([Article]) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase


        URLSession.shared.dataTask(with: sourcesURL) { (data, res, err) in
            DispatchQueue.main.sync {
                guard let d = data,let json = try? decoder.decode([Article].self, from: d) as [Article] else {
                    completion([])
                    return
                }
                completion(json)
            }
        }.resume()
    }

    func getById(_ id: String, completion: @escaping (Article?) -> Void) {
        completion(nil)
    }
    
    
}
