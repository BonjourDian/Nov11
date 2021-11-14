//
//  DetailViewController.swift
//  TestTechiOS
//
//  Created by DIAN on 13/11/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article : Article? /*{
        
        didSet {
            articleImage.load(urlString:(article?.imagesUrl.small)!)
            articleTitleLabel.text = article?.title
            articlePrix.text = "Prix: " + (article?.price.afficherUnFloat)!
            articleDescription.text = article?.description
            articleCreationDate.text = article?.creationDate
            articleisUrgent.text = "urgent"
        }
    }*/
    
    var categoryName : String? /*{
        
        didSet {
            articleCategoryName.text = categoryName
        }
         
    }*/
    
    private let detailView: UIView = {
        let myDetailView = UIView(frame: UIScreen.main.bounds)
        myDetailView.backgroundColor=UIColor.lightGray
        return myDetailView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
             
    }
    
    
    
}
