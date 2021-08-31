//
//  CoreDataArticle+CoreDataProperties.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//
//

import Foundation
import CoreData


extension CoreDataArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataArticle> {
        return NSFetchRequest<CoreDataArticle>(entityName: "CoreDataArticle")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var author: String?
    @NSManaged public var publishedAt: String?

}

extension CoreDataArticle : Identifiable {

}
