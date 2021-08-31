//
//  ViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newsViewModel = NewsViewModel()
        newsViewModel.getTopHighlights(forCountry: "us")
        
        let coreDataArticleInterface : CoreDataArticle = CoreDataArticle()
        let articles : [CoreDataArticle]? = coreDataArticleInterface.getAllArticles()
        print(articles?.count)
    }


}

