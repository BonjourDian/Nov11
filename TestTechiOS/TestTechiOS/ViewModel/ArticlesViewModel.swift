//
//  ArticlesViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import Foundation

class ArticlesViewModel : NSObject {
    
    private var articleApiService : ArticleApiService!
    private(set) var articlesData : [Article] = [] {
        didSet {
            self.bindArticleViewModelToController()
        }
    }
    
    var bindArticleViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.articleApiService =  ArticleApiService()
        callGetArticles()
    }
    
    func callGetArticles() {
        self.articleApiService.getArticles{(articlesData) in
            self.articlesData = articlesData
        }
    }
    
    
}
