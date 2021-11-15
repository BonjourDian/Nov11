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
        
        articleImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 0, width: 130, height: 0, enableInsets: false)
        articleTitleLabel.anchor(top: topAnchor, left: articleImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width/1.5, height: 0, enableInsets: false)
        articleCategoryName.anchor(top: articleTitleLabel.bottomAnchor, left: articleImage.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        articlePrix.anchor(top: articleCategoryName.bottomAnchor, left: articleImage.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width/2, height: 0, enableInsets: false)
        articleisUrgent.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 30, height: 0, enableInsets: false)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
