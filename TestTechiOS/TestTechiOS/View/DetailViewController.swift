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
            articlePrix.text = "Prix: " + (article?.price.afficherUnFloat)! + " €"
            articleDescription.text = "Description: " + "\n\n" + (article?.description)!
            articleCreationDate.text = "Date: " + (article?.creationDate)!
            
            if ((article?.isUrgent) != nil) {
                if article!.isUrgent {
                    articleisUrgent.text = "🔥 URGENT"
                } else {
                    articleisUrgent.text = "PAS urgent"
                }
            }
        }
    }
    
    var categoryName : String? {
        
        didSet {
            articleCategoryName.text = "Category: " + categoryName!
        }
         
    }

    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 249, green: 255, blue: 247)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    
    private var articleImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "loading"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let articlePrix: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemBrown
        return label
    }()
    
    private let articleCategoryName: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemBrown
        return label
    }()
    
    private let articleDescription: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .justified
        label.textColor = .black
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let articleCreationDate: UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.rgb(red: 89, green: 132, blue: 166)
        return label
    }()
    
    private let articleisUrgent: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 249, green: 255, blue: 247)
        setupScrollView()
        setupViews()
    }
    
    
    func setupScrollView(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        
        contentView.addSubview(articleImage)
        articleImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        articleImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        articleImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        articleImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        articleImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        contentView.addSubview(articleTitleLabel)
        articleTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleTitleLabel.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: 25).isActive = true
        articleTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        contentView.addSubview(articleCategoryName)
        articleCategoryName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleCategoryName.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 25).isActive = true
        articleCategoryName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
      
        
        contentView.addSubview(articleCreationDate)
        articleCreationDate.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleCreationDate.topAnchor.constraint(equalTo:articleCategoryName.bottomAnchor, constant: 25).isActive = true
        articleCreationDate.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        contentView.addSubview(articleisUrgent)
        articleisUrgent.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleisUrgent.topAnchor.constraint(equalTo:articleCreationDate.bottomAnchor, constant: 25).isActive = true
        articleisUrgent.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        contentView.addSubview(articlePrix)
        articlePrix.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articlePrix.topAnchor.constraint(equalTo:articleisUrgent.bottomAnchor, constant: 25).isActive = true
        articlePrix.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        contentView.addSubview(articleDescription)
        articleDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        articleDescription.topAnchor.constraint(equalTo:articlePrix.bottomAnchor, constant: 35).isActive = true
        articleDescription.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        articleDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    
}
