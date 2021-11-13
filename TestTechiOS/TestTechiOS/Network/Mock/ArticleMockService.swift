//
//  ArticleMockService.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//


class ArticleMockService: ArticleService {
    
    private let articles: [Article] = [
        
        Article(id:1461267313,
              categoryId:4,
              title:"Statue homme noir assis en plâtre polychrome",
              description:"Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
              price:140.00,
           
            imagesUrl: Article.ImagesUrl(
                small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg"
            ),
            
              creationDate:"2019-11-05T15:56:59+0000",
              isUrgent:false
           ),
    
    ]
    
    func getArticles(completion: @escaping ([Article]) -> Void) {
        completion(self.articles)
    }
    
    func getById(_ id: String, completion: @escaping (Article?) -> Void) {
        
    }
  
}


