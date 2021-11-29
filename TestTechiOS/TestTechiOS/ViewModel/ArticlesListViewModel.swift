//
//  ArticlesListViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import Foundation

class ArticlesListViewModel : NSObject {
/// Ce viewmodel récupère la liste des articles auprès du service API et les met à disposition des vues. Il comporte également des fonctions pour trier et filtrer les données.

// MARK: - Déclaration des variables
    
    private let articlesServiceProtocol: ArticlesServiceProtocol
    
    private(set) var articlesData : [Article] = [] {
        didSet {
            self.bindArticleViewModelToController()
        }
    }
    
    var bindArticleViewModelToController : (() -> ()) = {}
    
    var articlesFilter: [Article] = []

// MARK: - Initialisation du VueModel
    init(_ articlesServiceProtocol: ArticlesServiceProtocol) {
        self.articlesServiceProtocol = articlesServiceProtocol
        super.init()
        callGetArticlesAPI()
    }

// MARK: - Définition des fonctions
    
    func callGetArticlesAPI() {
        /// Cette fonction récupère la liste des articles et les trie par date puis par urgence
        self.articlesServiceProtocol.getArticlesAPI{(articlesData) in
            self.articlesData = articlesData
            self.articlesData = self.orderByDate(self.articlesData)
            self.articlesData = self.orderByUrgency(self.articlesData)
        }
    }
    
    func getArticles(filter: Bool) -> [Article] {
        /// Cette fonction renvoit la liste des articles complète ou la liste des articles filtrée par catégorie
        var articles: [Article] = []
        if filter {
            articles = articlesFilter
        } else {
            articles = articlesData
        }
        return articles
    }
    
    func updateWithFilter(_ categoryIdFilter: Int64) {
        if categoryIdFilter >= 0 {
            articlesFilter = self.articlesData.filter { $0.categoryId == categoryIdFilter}
        }
    }
    
    
    func orderByDate(_ articlesList: [Article]) -> [Article] {
        // Info - Format de date: "2019-10-16T17:10:20+0000"
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
