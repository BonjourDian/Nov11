//
//  ImageServiceApi.swift
//  TestTechiOS
//
//  Created by DIAN on 28/11/2021.
//

import Foundation

class ImageServiceApi: ImageServiceProtocol {
    
    func getImageAPI(_ imageUrl: String, completion: @escaping (Data) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let sourceUrl = URL(string: imageUrl) else {return}

        URLSession.shared.dataTask(with: sourceUrl) { (data, res, err) in DispatchQueue.main.sync {
                guard let imageData = data else {
                    print("Image download failed")
                    completion(Data())
                    return
                }
                completion(imageData)
            }
        }.resume()
    }
}
