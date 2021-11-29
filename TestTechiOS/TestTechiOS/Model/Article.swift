//
//  Article.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//

struct Article: Equatable, Codable {
    var id: Int64
    var categoryId: Int64
    var title: String
    var description: String
    var price: Float
    var imagesUrl: ImagesUrl
    var creationDate: String
    var isUrgent: Bool
    
    struct ImagesUrl: Equatable, Codable {
        var small: String?
        var thumb: String?
    }
    
}
