//
//  ArticleMockService.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//


class ArticleMockService: ArticleService {
    
    private let articles: [Article] = [
        Article(
              id:1701863837,
              categoryId:1,
              title:"2 phare xénon megane 2 année 2003 avec ballast et ampoule",
              description:"2 phare xénon megane 2 année 2003 avec ballast et ampoule",
              price:250.00,
              imagesUrl:Article.ImagesUrl(
                 small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/04e2ab5030a9977052b629a2204a636c5f88d2ed.jpg",
                 thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/04e2ab5030a9977052b629a2204a636c5f88d2ed.jpg"
              ),
              creationDate:"2019-11-05T15:56:24+0000",
              isUrgent:false
           ),
        Article(
              id:1077103477,
              categoryId:2,
              title:"Ensemble fille 1 mois NEUF",
              description:"Vends Robe avec t-shirt neuf Presti Presto en 1 mois.",
              price:5.00,
              imagesUrl:Article.ImagesUrl(
                 small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg",
                 thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/5ae4741dabd3a236cbfb8b6a5746acba6823e41e.jpg"
              ),
              creationDate:"2019-11-05T15:56:52+0000",
              isUrgent:true
           ),
        Article(
              id:1701863873,
              categoryId:3,
              title:"Radiateurs",
              description:"3 radiateurs de différents dimensions : Largeur x hauteur x profondeur : 105 x 42 x 13 59 x 42 x 13 48 x 50 x 10 Prix : 60 € le lot ou prix à l'unité",
              price:10.00,
              imagesUrl:Article.ImagesUrl(
                 small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/cc058715b0279ab8dbd11146050a1eddd769524f.jpg",
                 thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/cc058715b0279ab8dbd11146050a1eddd769524f.jpg"
              ),
              creationDate:"2019-11-05T15:56:35+0000",
              isUrgent:false
           ),
        Article(
            id:1701863234,
            categoryId:2,
            title:"NEUF - PULL - coton/soie - HOMME - XL - Zara",
            description:"NEUF - PULL en Coton / Soie et Lin fin - couleur Moutarde - ZARA MAN - HOMME - TAILLE XL (peut convenir également à une taille L confort) - Col rond - Peut se porter à même la peau - Jamais porté - NEUF. REMISE EN MAIN PROPRE UNIQUEMENT (PARIS 20e). Paiement Paypal et envoi non accepté.",
            price:15.00,
            imagesUrl: Article.ImagesUrl(
             small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/16b97236fb013555eb773266ad1d6b1c842a09e0.jpg",
             thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/16b97236fb013555eb773266ad1d6b1c842a09e0.jpg"
            ),
            creationDate:"2019-11-05T15:55:30+0000",
            isUrgent:true
        ),
    ]

     
    func getArticles(completion: @escaping ([Article]) -> Void) {
        completion(self.articles)
    }
    
    func getById(_ id: String, completion: @escaping (Article?) -> Void) {
        
    }
  
}

