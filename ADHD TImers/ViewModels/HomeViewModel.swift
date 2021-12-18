//
//  HomeViewModel.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    
    var dataHandler = DataHandler()
    
    
    @Published var timers: [TimeKeeper] = []
    
    init() {
        let timersFetch = TimeKeeper.fetchRequest()
        do {
            let results = try dataHandler.dataStack.context.fetch(timersFetch)
            self.timers = results
        } catch let error as NSError {
            print("Error fetching results \(error), \(error.userInfo)")
        }
    }
}
