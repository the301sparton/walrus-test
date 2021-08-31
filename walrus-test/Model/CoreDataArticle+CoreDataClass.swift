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
   
    func createArticle(baseArticle : Article) {
        
        let article : CoreDataArticle = CoreDataArticle(context: CoreDataContainer.shared.context)
        
        article.title = baseArticle.title
        article.desc = baseArticle.description
        article.url = baseArticle.url
        article.urlToImage = baseArticle.urlToImage
        article.author = baseArticle.author
        article.publishedAt = baseArticle.publishedAt
        
        CoreDataContainer.shared.saveContext()
    }
    
    func getAllArticles() -> [CoreDataArticle]? {
        do {
            guard let result = try CoreDataContainer.shared.context.fetch(CoreDataArticle.fetchRequest()) as? [CoreDataArticle] else {return nil}
            return result
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func deleteAllArticles() -> Bool {
        if let articles : [CoreDataArticle] = self.getAllArticles() {
            for article in articles {
                CoreDataContainer.shared.context.delete(article)
            }
            return true
        } else {
            return false
        }
    }
}
