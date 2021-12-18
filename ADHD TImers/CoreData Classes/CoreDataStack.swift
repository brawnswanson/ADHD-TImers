//
//  DataModule.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private lazy var container: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Timers")
        persistentContainer.loadPersistentStores { descriptor, error in
            if let error = error as NSError? {
                print("Error loading persisten store \(error)", error.userInfo)
            }
        }
        return persistentContainer
    }()
    
    lazy var context = container.viewContext
    
    func saveContext() {
        guard context.hasChanges else {
            return
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving context \(error), \(error.userInfo)")
        }
    }
    
}
