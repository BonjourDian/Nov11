//
//  ArticleCell.swift
//  TestTechiOS
//
//  Created by DIAN on 12/11/2021.
//

import UIKit


class ArticleCell : UITableViewCell {
    
    static let identifier = "ArticleCell"
    
    var article : Article? {
        didSet {
            articleImage.load(urlString:(article?.imagesUrl.thumb)!)
            articleTitleLabel.text = article?.title
            articlePrix.text = "Prix: " + (article?.price.afficherUnFloat)! + " €"
            if ((article?.isUrgent) != nil) {
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
            articleCategoryName.text = categoryName
        }
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
       // contentView.backgroundColor = .orange
        contentView.addSubview(articleImage)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articlePrix)
        contentView.addSubview(articleCategoryName)
        contentView.addSubview(articleisUrgent)
        
        articleImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        articleTitleLabel.anchor(top: topAnchor, left: articleImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width/1.3, height: 0, enableInsets: false)
        articlePrix.anchor(top: articleTitleLabel.bottomAnchor, left: articleImage.rightAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width/2, height: 0, enableInsets: false)
        articleisUrgent.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 50, height: 0, enableInsets: false)
        articleCategoryName.anchor(top: articleTitleLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.size.width/2, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
