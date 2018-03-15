//
//  Movies+CoreDataProperties.swift
//  
//
//  Created by Adrien Meyer on 15/03/2018.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseYear: Int16
    @NSManaged public var titles: String?
    @NSManaged public var genres: [String]?

}
