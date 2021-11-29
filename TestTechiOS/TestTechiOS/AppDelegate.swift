//
//  AppDelegate.swift
//  TestTechiOS
//
//  Created by DIAN on 11/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let articlesServiceApi = ArticlesServiceApi()
        let categoriesServiceApi = CategoriesServiceApi()
        let imageServiceApi = ImageServiceApi()
        
        let listeViewController = ListeViewController()
        listeViewController.bindViewModels(articlesServiceProtocol: articlesServiceApi, categoriesServiceProtocol: categoriesServiceApi)
        listeViewController.imageServiceProtocol = imageServiceApi
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: listeViewController)
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

