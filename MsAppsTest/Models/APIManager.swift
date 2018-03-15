//
//  APIManager.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import Foundation

class APIManager: NSObject
{
    let apiPath: String = "http://api.androidhive.info/json/movies.json"
    
    static let sharedInstance = APIManager()
    
    public func getTopMovies(completionHandler: @escaping ([JsonMovies]?,Error?) -> Void )
    {
        
        let url = URL(string: apiPath)
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            
            guard error == nil,
                let data : Data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json : [[String : Any]] = rawJSON as? [[String : Any]]
                
                else
            {
                completionHandler(nil,error)
                return
            }
            
            var movies : [JsonMovies] = []
            
            for movie in json
            {
                let movie : JsonMovies = JsonMovies(dict: movie)
                movies.append(movie)
            }
            completionHandler(movies,nil)
            
        }
        task.resume()
    }
    
}
