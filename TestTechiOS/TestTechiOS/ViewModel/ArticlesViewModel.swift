//
//  ArticlesViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import Foundation

class ArticlesViewModel : NSObject {
    
    private var articleService : ArticleService{
        //return ArticleMockService()
        return ArticleApiService()
    }
    
    private(set) var articlesData : [Article] = [] {
        didSet {
            self.bindArticleViewModelToController()
        }
    }
    
    var bindArticleViewModelToController : (() -> ()) = {}
    
    var articlesFilter: [Article] = []
    
    override init() {
        super.init()
        callGetArticles()
    }
    
    func callGetArticles() {
        self.articleService.getArticles{(articlesData) in
            self.articlesData = articlesData
            self.articlesData = self.orderByDate(self.articlesData)
            self.articlesData = self.orderByUrgency(self.articlesData)
        }
    }
    
    func updateWithFilter(_ categoryIdFilter: Int64) {
        callGetArticles()
        self.filterByCategory(categoryIdFilter: categoryIdFilter)
    }
    
    func filterByCategory(categoryIdFilter: Int64) {
        if categoryIdFilter >= 0 {
            articlesFilter = self.articlesData.filter { $0.categoryId == categoryIdFilter}
        }
    }
    
    func orderByDate(_ articlesList: [Article]) -> [Article] {
        // "2019-10-16T17:10:20+0000"
        let dateFormatter = ISO8601DateFormatter()
        var articlesListOrdered: [Article] = []
        articlesListOrdered = articlesList.sorted(by:{ dateFormatter.date(from: $0.creationDate)?.compare(dateFormatter.date(from: $1.creationDate)!) == .orderedDescending})
        return articlesListOrdered
    }
    
    func orderByUrgency(_ articlesList: [Article]) -> [Article] {
        var articlesListOrdered: [Article] = []
        articlesListOrdered = articlesList.sorted { $0.isUrgent && !$1.isUrgent }
        return articlesListOrdered
    }

}
