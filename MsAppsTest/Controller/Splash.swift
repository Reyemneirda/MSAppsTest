//
//  ViewController.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit
import MBProgressHUD
import CoreData

class Splash: BaseViewController {

    var movies : [JsonMovies]? = []
    
    var coreMovies: [Movies]? = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadMovies()

    }

    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    
    
    
    func loadMovies() {
           MBProgressHUD.showAdded(to: self.mainView, animated: true)
        APIManager.sharedInstance.getTopMovies { (movie, error) in
            DispatchQueue.main.async {

                self.clearData()
                
                if let movies = movie
                {
                    self.movies = movies
                    
                    for movie in self.movies! {
                        
                        self.coreMovies = [Movies(context: PersistenceServices.context, jsonMovies: movie)]
                    }
                    
                    MBProgressHUD.hide(for: self.mainView, animated: true)

                        PersistenceServices.saveContext()
                    
                    self.performSegue(withIdentifier: "splash", sender: self)
                }
                else
                {
                    var errorMessage : String = "Could not load data"
                    
                    if error != nil
                    {
                        errorMessage = (error?.localizedDescription)!
                    }
                    
                    let alertView = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertView.addAction(cancelAction)
                    
                    self.present(alertView, animated: true, completion: nil)
                }
            }
            
        }
        }
    
    
    private func clearData() {
        do {
            
            let context = PersistenceServices.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Movies.self))
            do {
                let objects  = try context.fetch(fetchRequest) as? [NSManagedObject]
                _ = objects.map{$0.map{context.delete($0)}}
                PersistenceServices.saveContext()
            } catch let error {
                print("ERROR DELETING : \(error)")
            }
        }
    }
    
    
}

