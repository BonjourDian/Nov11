//
//  ImageViewModel.swift
//  TestTechiOS
//
//  Created by DIAN on 28/11/2021.
//

import Foundation
import UIKit

class ImageViewModel : NSObject {
    
    private let imageUrl: String = ""
    private let imageServiceProtocol: ImageServiceProtocol
    
    private(set) var image : UIImage = UIImage() {
        didSet {
            self.bindImageViewModelToController()
        }
    }
    
    var bindImageViewModelToController : (() -> ()) = {}
    
    init(_ imageServiceProtocol: ImageServiceProtocol) {
        self.imageServiceProtocol = imageServiceProtocol
        super.init()
    }
    
    func callGetImageAPI(_ imageUrl: String) {
        /// Cette fonction récupère les données de l'image
        self.imageServiceProtocol.getImageAPI(imageUrl) {(imageData) in
            self.image = UIImage(data: imageData) ?? UIImage()
        }
    }
    
    func getImage(_ imageUrl: String) -> UIImage {
        callGetImageAPI(imageUrl)
        return self.image
    }
}
