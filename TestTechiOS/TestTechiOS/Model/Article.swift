//
//  Article.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//

struct Article {
    var id: Int64
    var categoryId: Int64
    var title: String
    var description: String
    var price: Float
    var imagesUrl: ImagesUrl
    var creationDate: String
    var isUrgent: Bool
    
    struct ImagesUrl{
        var small: String?
        var thumb: String?
    }
    
}

