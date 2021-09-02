//
//  CoreDataArticle+CoreDataClass.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//
//

import Foundation
import CoreData

@objc(CoreDataArticle)
public class CoreDataArticle: NSManagedObject {
   
    static func createArticle(baseArticles : [Article]) {
        for baseArticle in baseArticles {
            let article : CoreDataArticle = CoreDataArticle(context: CoreDataContainer.shared.context)
            article.title = baseArticle.title
            article.desc = baseArticle.description
            article.url = baseArticle.url
            article.urlToImage = baseArticle.urlToImage
            article.author = baseArticle.author
            article.publishedAt = baseArticle.publishedAt
        }
        CoreDataContainer.shared.saveContext()
    }
    
    static func getAllArticlesToDelete() -> [CoreDataArticle]? {
        do {
            guard let result = try CoreDataContainer.shared.context.fetch(CoreDataArticle.fetchRequest()) as? [CoreDataArticle] else {return nil}
            return result
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func getAllArticles() -> [Article]? {
        do {
            guard let result = try CoreDataContainer.shared.context.fetch(CoreDataArticle.fetchRequest()) as? [CoreDataArticle] else {return nil}
            var articleArray : [Article] = [Article]()
            for article in result {
                let articleObj = Article(coreDataArticle: article)
                articleArray.append(articleObj)
            }
            return articleArray
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func deleteAllArticles() -> Bool {
        if let articles : [CoreDataArticle] = self.getAllArticlesToDelete() {
            for article in articles {
                CoreDataContainer.shared.context.delete(article)
            }
            return true
        } else {
            return false
        }
    }
}
