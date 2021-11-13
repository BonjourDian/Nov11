//
//  ArticleFactory.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//


class ArticleFactory {
    
    static func ArticleWith(dictionary: [String: Any]) -> Article? {
        guard
            let id = dictionary["id"] as? Int64,
            let categoryId = dictionary["category_id"] as? Int64,
            let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String,
            let price = dictionary["price"] as? Float,
            let imagesUrl = dictionary["images_url"] as? [String: Any],
            let small = imagesUrl["small"] as? String,
            let thumb = imagesUrl["thumb"] as? String,
            let creationDate = dictionary["creation_date"] as? String,
            let isUrgent = dictionary["is_urgent"] as? Bool
        else {
                return nil
        }
        
        let imagesUrlModel = Article.ImagesUrl(small: small, thumb: thumb)
        
        return Article(id: id,
                       categoryId: categoryId,
                       title: title,
                       description : description ,
                       price: price,
                       imagesUrl: imagesUrlModel,
                       creationDate: creationDate,
                       isUrgent: isUrgent)
    }
    
}
