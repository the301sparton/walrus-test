//
//  CoreDataContainer.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import Foundation


import Foundation
import CoreData
final class CoreDataContainer {
    
    private init(){}
    static let shared = CoreDataContainer()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "walrus_test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
