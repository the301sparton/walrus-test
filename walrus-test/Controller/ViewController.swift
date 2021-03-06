//
//  ViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var newsViewModel = NewsViewModel()
    var articleList = [Article]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Get Articles from ViewModel
        newsViewModel.getTopHighlights(forCountry: "us"){ [self]
            (result) in
            articleList = result
            DispatchQueue.main.async {
                self.tableView.register(UINib(nibName: "ArticleCard", bundle: nil), forCellReuseIdentifier: "ArticleCard")
                self.tableView.reloadData()
            }
        }
    }
    
    // Set theme for StatusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Custom Cell for TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCard", for: indexPath) as? ArticleCard
        cell?.parent = self
        // Get article At IndexPath
        let article : Article = (articleList[indexPath.row])
        // SetUp View
        cell?.setArticleView(article: article)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450 // Fixed Height for each cell
    }
}

