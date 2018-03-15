
//
//  Movies+CoreDataClass.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 15/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Movies)
public class Movies: NSManagedObject {
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movies", in: context)
        self.init(entity: entityDescription! , insertInto: context)
    }
    
    convenience init(context: NSManagedObjectContext, jsonMovies: JsonMovies) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movies", in: context)
        self.init(entity: entityDescription! , insertInto: context)
        
        titles = jsonMovies.title
        imageUrl = jsonMovies.imageUrl
        
        if let rating = jsonMovies.rating{
            self.rating = rating
            
        }
        if let releaseYear = jsonMovies.releaseYear{
            self.releaseYear = Int16(releaseYear)
        }
        genres = jsonMovies.genre
        
    }
}
