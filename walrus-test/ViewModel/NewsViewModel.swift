//
//  NewsViewModel.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import Foundation
import UIKit

class NewsViewModel {
    
    var topHeadlinesResponse : BaseResponse?
    var articlesArray : [Article]?
    
    func getTopHighlights(forCountry : String,completion:@escaping ([Article]) -> Void) {
        let url = Util.endPoint + "country=" + forCountry + "&apiKey=" + Util.apiKey
        URLSession.shared.dataTask(with: URL(string: url)!){
            (data, res, error) in
            if error == nil {
                if let data = data {
                    do {
                        self.topHeadlinesResponse = try JSONDecoder().decode(BaseResponse.self, from: data)
                        if let articles : [Article] = self.topHeadlinesResponse?.articles {
                            // Delete all previous articles
                            let _ : Bool = CoreDataArticle.deleteAllArticles()
                            // Insert new articles in local DB
                            CoreDataArticle.createArticle(baseArticles: articles)
                            self.articlesArray = self.topHeadlinesResponse?.articles
                            completion(articles)
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            else {
                // If offline return articles from local DB
                self.articlesArray = CoreDataArticle.getAllArticles()
                completion(self.articlesArray!)
                print(error?.localizedDescription as Any)
            }
        }.resume()
    }
}
