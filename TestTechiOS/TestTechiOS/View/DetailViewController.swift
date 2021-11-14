//
//  DetailViewController.swift
//  TestTechiOS
//
//  Created by DIAN on 13/11/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article : Article? {
        
        didSet {
            articleImage.load(urlString:(article?.imagesUrl.small)!)
            articleTitleLabel.text = article?.title
            articlePrix.text = "Prix: " + (article?.price.afficherUnFloat)!
           // articleDescription.text = article?.description
           // articleCreationDate.text = article?.creationDate
            articleisUrgent.text = "urgent"
        }
    }
    
    var categoryName : String? {
        
        didSet {
            articleCategoryName.text = categoryName
        }
         
    }
    
    
  
    
    private let detailView: UIView = {
        let myDetailView = UIView(frame: UIScreen.main.bounds)
        myDetailView.backgroundColor=UIColor.lightGray
        return myDetailView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        
        view.addSubview(articleImage)
        view.addSubview(articleTitleLabel)
        view.addSubview(articlePrix)
        view.addSubview(articleCategoryName)
        view.addSubview(articleisUrgent)
             
    }
    
    
    private var articleImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "loading"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let articlePrix: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .systemBrown
        return label
    }()
    
    private let articleCategoryName: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .systemBrown
        return label
    }()
    
    private let articleisUrgent: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    
}
