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
        articleTableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return articleTableView
    }()
    
    private let articleUIPicker: UIPickerView = {
        let UIPicker = UIPickerView()
        return UIPicker
    }()
    
    var pickerCategoryId: Int64 = -1
    
    var dataTriArticles: [Article] = []
    
    private var articlesViewModel : ArticlesViewModel!
    private var categoryViewModel : CategoryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(articleTableView)
        callViewModelForUIUpdate()
        articleTableView.dataSource = self
        articleTableView.delegate = self
        configureUI()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        articleTableView.frame = view.bounds
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
       // navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Articles"
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
        self.articlesViewModel.updateWithFilter(pickerCategoryId)
        dataTriArticles = self.articlesViewModel.articlesFilter
        self.articleTableView.reloadData()
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    @objc func onClickedResetButton() {
        self.dataTriArticles = self.articlesViewModel.articlesData
        self.articleTableView.reloadData()
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    @objc func onClickedCancelButton() {
        articleUIPicker.isHidden = true
        self.navigationController?.isToolbarHidden = true
    }
    
    func callViewModelForUIUpdate(){
        self.articlesViewModel = ArticlesViewModel()
        self.categoryViewModel = CategoryViewModel()
        self.articlesViewModel.bindArticleViewModelToController = {
            self.categoryViewModel.bindCategoryViewModelToController = {
                self.dataTriArticles = self.articlesViewModel.articlesData
                self.articleTableView.reloadData()
            }
        }
    }
    
 
}


extension ListeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let categoryNameList = self.categoryViewModel.getNameList()
        return categoryNameList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let categoryNameList = self.categoryViewModel.getNameList()
        return categoryNameList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerCategoryId = Int64(row + 1)
    }
}
 

extension ListeViewController:  UITableViewDataSource, UITableViewDelegate {
    // MARK - UITableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataTriArticles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell : ArticleCell? = (tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticleCell)
        if cell == nil {
            cell = ArticleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        if dataTriArticles.count > 0 {
            let article = dataTriArticles[indexPath.row]
            let categoryName = self.categoryViewModel.getNameById(article.categoryId)
            cell?.article = article
            cell?.categoryName = categoryName

        }
        cell?.textLabel?.numberOfLines = 0

        return cell!
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let destination = DetailViewController()
        let article = dataTriArticles[indexPath.row]
        let categoryName = self.categoryViewModel.getNameById(article.categoryId)
        destination.article = article
        destination.categoryName = categoryName
        navigationController?.pushViewController(destination, animated: true)
    }

}

