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
    
    func filterArticlesByCategory(_ categoryIdFilter: Int64) {
        var articlesFilter: [Article] = []
        callGetArticles()
        articlesFilter = articlesData.filter { $0.categoryId == categoryIdFilter}
        articlesData = articlesFilter
    }
    
    func orderByDate(articlesList: [Article]) -> [Article] {
        // "2019-10-16T17:10:20+0000"
        var articlesListOrdered: [Article] = []
        
        return articlesListOrdered
    }
    
    func orderByUrgency(articlesList: [Article]) -> [Article] {
        var articlesListOrdered: [Article] = []
        return articlesListOrdered
    }
    
}
