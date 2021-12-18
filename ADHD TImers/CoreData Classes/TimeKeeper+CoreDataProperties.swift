//
//  TimeKeeper+CoreDataProperties.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//
//

import Foundation
import CoreData


extension TimeKeeper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeKeeper> {
        return NSFetchRequest<TimeKeeper>(entityName: "TimeKeeper")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var durationBased: Bool
    @NSManaged public var durationInSeconds: Int64
    @NSManaged public var endTime: Date?
    @NSManaged public var useCount: Int64

}

extension TimeKeeper : Identifiable {

}
