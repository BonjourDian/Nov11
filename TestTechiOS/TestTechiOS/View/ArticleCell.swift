//
//  ArticleCell.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import UIKit


class ArticleCell : UITableViewCell {
    
    var article : Article? {
        didSet {
           guard let articleItem = article else {return}
            if  articleImage.image != nil {
                articleImage.load(urlString:(article?.imagesUrl.thumb)!)
                articleTitleLabel.text = articleItem.title
                articlePrix.text = "Prix: " + (article?.price.afficherUnFloat)! + " €"
                
                    if article!.isUrgent {
                        articleisUrgent.text = "🔥"
                    } else {
                        articleisUrgent.text = ""
                    }
            }
            
        }
    }
    
    var categoryName : String? {
        didSet {
            articleCategoryName.text = "Category: " + categoryName!
        }
    }
    
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
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
        label.textColor = .systemGray
        //label.clipsToBounds = true
        label.numberOfLines = 0
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        contentView.addSubview(articleImage)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articlePrix)
        contentView.addSubview(articleCategoryName)
        contentView.addSubview(articleisUrgent)
        cellUI()
    }
    
    
    
    func cellUI() {
        
        articleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.5).isActive = true
        articleImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        articleImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2/5).isActive = true
        articleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2.5).isActive = true
        
        
        articleTitleLabel.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 25).isActive = true
        articleTitleLabel.rightAnchor.constraint(equalTo:articleisUrgent.leftAnchor, constant: -5).isActive = true
        articleTitleLabel.leftAnchor.constraint(equalTo:articleImage.rightAnchor, constant: 15).isActive = true
        
        
        articleCategoryName.topAnchor.constraint(equalTo:articleTitleLabel.bottomAnchor, constant: 15).isActive = true
        articleCategoryName.rightAnchor.constraint(equalTo:articleisUrgent.leftAnchor, constant: -5).isActive = true
        articleCategoryName.leftAnchor.constraint(equalTo:articleImage.rightAnchor, constant: 15).isActive = true
        
        
        articlePrix.topAnchor.constraint(equalTo:articleCategoryName.bottomAnchor, constant: 15).isActive = true
        articlePrix.rightAnchor.constraint(equalTo:articleisUrgent.leftAnchor, constant: 15).isActive = true
        articlePrix.leftAnchor.constraint(equalTo:articleImage.rightAnchor, constant: 15).isActive = true
        
    
        
        articleisUrgent.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        articleisUrgent.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        articleisUrgent.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/9).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
