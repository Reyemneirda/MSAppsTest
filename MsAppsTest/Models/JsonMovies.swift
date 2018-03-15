//
//  Movies.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import Foundation


class JsonMovies: NSObject
{
    var title: String?
    var imageUrl: String?
    var rating: Double?
    var releaseYear: Int?
    var genre: [String]?
    
    init(dict: [String:Any] )
    {
        if let title : String = dict["title"] as? String
        {
            self.title = title
        }
        
        if let rating : Double = dict["rating"] as? Double
        {
            self.rating = rating
        }
        
        if let releaseYear = dict["releaseYear"] as? Int
        {
            self.releaseYear = releaseYear
        }
        
        if let image = dict["image"] as? String
        {
            self.imageUrl = image
            
        }
        
        if let genreArray : [String] = dict["genre"] as? [String]
        {
            self.genre = genreArray
        }
    }
}
