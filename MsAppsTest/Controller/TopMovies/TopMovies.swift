//
//  TopMovies.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit
import CoreData

class TopMovies: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
       let fetchRequest: NSFetchRequest<Movies> = Movies.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "releaseYear", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: PersistenceServices.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc as! NSFetchedResultsController<NSFetchRequestResult>
    }()
    
    
    var movies: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        
        do
        {
            try self.fetchedhResultController.performFetch()
            
                 let movie = self.fetchedhResultController.fetchedObjects
                    
            self.movies = movie as! [Movies]
            
            self.movies.sort(){$0.releaseYear > $1.releaseYear}
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
            
        } catch {}
        
        
        self.tableView.register(UINib(nibName: "MoviesCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")

       
        // Do any additional setup after loading the view.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : MoviesCell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MoviesCell)!
        
        let movies : Movies = self.movies[indexPath.row]
        
        cell.updateCells(movie: movies)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let movies : Movies = self.movies[indexPath.row]
        
        self.performSegue(withIdentifier: "movieDetails", sender: movies)
    }
    
    @IBAction func qrReader() {
        self.performSegue(withIdentifier: "qrCode", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc : MovieDetails = segue.destination as? MovieDetails
        {
            vc.movie = sender as? Movies
        }
    }
    
}
