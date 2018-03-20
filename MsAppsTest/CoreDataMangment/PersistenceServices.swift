//
//  PersistenceServices.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 15/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import Foundation
import CoreData

class PersistenceServices {
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {

        
        let container = NSPersistentContainer(name: "MsAppsTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    static func saveContext() {
        let context = PersistenceServices.persistentContainer.viewContext
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
