//
//  ListeViewController.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import UIKit


class ListeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {


    private let articleTableView: UITableView = {
        let articleTableView = UITableView()
        articleTableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return articleTableView
    }()
    
    private var articlesViewModel : ArticlesViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(articleTableView)
        
        articleTableView.dataSource = self
        articleTableView.delegate = self

        callToViewModelForUIUpdate()
    }
    
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        articleTableView.frame = view.bounds
    }
    
    
    func callToViewModelForUIUpdate(){
            self.articlesViewModel =  ArticlesViewModel()
            self.articlesViewModel.bindArticleViewModelToController = {
                self.articleTableView.reloadData()
            }
        }


    // MARK - UITableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articlesViewModel.articlesData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell : ArticleCell? = (tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticleCell)
        if cell == nil {
            cell = ArticleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        if self.articlesViewModel.articlesData.count > 0 {
            let article = self.articlesViewModel.articlesData[indexPath.row]
        
            cell?.article = article

        }
        cell?.textLabel?.numberOfLines = 0

        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100.0
        }
}
