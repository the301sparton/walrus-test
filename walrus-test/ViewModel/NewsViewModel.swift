//
//  NewsViewModel.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import Foundation
class NewsViewModel {
    var topHeadlinesResponse : BaseResponse?
    func getTopHighlights(forCountry : String) {
        let url = Util.endPoint + "country=" + forCountry + "&apiKey=" + Util.apiKey
        URLSession.shared.dataTask(with: URL(string: url)!){
            (data, res, error) in
            if error == nil {
                if let data = data {
                    do {
                        self.topHeadlinesResponse = try JSONDecoder().decode(BaseResponse.self, from: data)
                        if let articles : [Article] = self.topHeadlinesResponse?.articles {
                            // Delete all previous articles
                            let coreDataArticleInterface : CoreDataArticle = CoreDataArticle()
                            let _ : Bool = coreDataArticleInterface.deleteAllArticles()
                            // Insert new articles in local DB
                            for article in articles {
                                coreDataArticleInterface.createArticle(baseArticle: article)
                            }
                            print("Articles Inserted In DB")
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            else {
                print(error?.localizedDescription as Any)
            }
        }.resume()
    }
}
