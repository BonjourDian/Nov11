//
//  ArticleApiService.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//

import Foundation

class ArticleApiService: ArticleService {
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!
    
    func getArticles(completion: @escaping ([Article]) -> Void) {
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
    /*
    func getDataFromUrl(url: String, completion: @escaping (NSData) -> Void) {
        let imageUrl = URL(string: url)
        URLSession.shared.dataTask(with: imageUrl!) { (data, response, error) in
            DispatchQueue.main.sync {
                let imageData = NSData(data: data!)
                completion(imageData)
            }
        }.resume()
    }
    */
    func getById(_ id: String, completion: @escaping (Article?) -> Void) {
        completion(nil)
    }
    
    
}
