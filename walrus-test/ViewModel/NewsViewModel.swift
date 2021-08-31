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
        print(url)
        URLSession.shared.dataTask(with: URL(string: url)!){
            (data, res, error) in
            if error == nil {
                if let data = data {
                    do {
                        self.topHeadlinesResponse = try JSONDecoder().decode(BaseResponse.self, from: data)
                        print(self.topHeadlinesResponse ?? "")
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