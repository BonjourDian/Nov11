//
//  ListeViewController.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import UIKit


class ListeViewController: UIViewController {
    
    private let articleTableView: UITableView = {
        let articleTableView = UITableView()
        articleTableView.register(ArticleCell.self, forCellReuseIdentifier : "cell")
        articleTableView.backgroundView = UIImageView(image: UIImage(named: "loading"))
        return articleTableView
    }()
    
    private let articleUIPicker: UIPickerView = {
        let UIPicker = UIPickerView()
        return UIPicker
    }()
    
    var pickerCategoryId: Int64 = 1
    
    var dataTriArticles:[Article] = [] {
        didSet {
                self.articleTableView.reloadData()
                self.articleTableView.backgroundView = UIImageView(image: nil)
            }
        }
    
    var isFilterActive: Bool = false
    
    var categoryNameList: [String] = []
    
    private var articlesViewModel : ArticlesViewModel!
    private var categoryViewModel : CategoryViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        articleTableView.dataSource = self
        articleTableView.delegate = self
        view.addSubview(articleTableView)
        callViewModelForUIUpdate()
        TableViewUI()
        navigationUI()
    }

    
    func callViewModelForUIUpdate(){
        self.articlesViewModel = ArticlesViewModel()
        self.categoryViewModel = CategoryViewModel()
        
        self.articlesViewModel.bindArticleViewModelToController = {
            self.updateArticlesWithData()
        }
        self.categoryViewModel.bindCategoryViewModelToController = {
            self.updateCategoriesWithData()
        }
        
        self.articleTableView.reloadData()
        
    }
    
    func updateArticlesWithData() {
        dataTriArticles = self.articlesViewModel.getArticles(filter: self.isFilterActive)
    }
    
    func updateCategoriesWithData() {
        categoryNameList = self.categoryViewModel.getNameList()
    }
    
    func TableViewUI() {
        articleTableView.translatesAutoresizingMaskIntoConstraints = false
        articleTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        articleTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        articleTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        articleTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
        
    func navigationUI() {
        navigationItem.title = "Articles"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        let searchBtn = UIBarButtonItem(title: "Filtre", style: .plain, target: self, action: #selector(self.handleShowSearchBtn))
        self.navigationItem.rightBarButtonItem = searchBtn
    }
    
    @objc func handleShowSearchBtn() {
        articleUIPicker.isHidden = false
        articleUIPicker.delegate = self as UIPickerViewDelegate
        articleUIPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(articleUIPicker)
        articleUIPicker.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        articleUIPicker.backgroundColor = .white
        articleUIPicker.frame = view.bounds
        
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onClickedCancelButton)))
        items.append(
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(self.onClickedResetButton)))
        items.append(
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil))
        items.append(
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.onClickedDoneButton)))
        toolbarItems = items
    }
    
    @objc func onClickedDoneButton() {
        self.isFilterActive = true
        self.articlesViewModel.updateWithFilter(self.pickerCategoryId)
        self.dataTriArticles = self.articlesViewModel.getArticles(filter: self.isFilterActive)
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    @objc func onClickedResetButton() {
        self.isFilterActive = false
        self.dataTriArticles = self.articlesViewModel.getArticles(filter: self.isFilterActive)
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    @objc func onClickedCancelButton() {
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
 
}


extension ListeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.categoryNameList = self.categoryViewModel.getNameList()
        return self.categoryNameList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.categoryNameList = self.categoryViewModel.getNameList()
        return self.categoryNameList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCategoryId = Int64(row + 1)
    }
}
 

extension ListeViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTriArticles.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! ArticleCell)
        
        let article = dataTriArticles[indexPath.row]
        let categoryName = self.categoryViewModel.getNameById(article.categoryId)
        cell.article = article
        cell.categoryName = categoryName

        return cell
        
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = DetailViewController()
        let article = dataTriArticles[indexPath.row]
        let categoryName = self.categoryViewModel.getNameById(article.categoryId)
        destination.article = article
        destination.categoryName = categoryName
        navigationController?.pushViewController(destination, animated: true)
    }

}

