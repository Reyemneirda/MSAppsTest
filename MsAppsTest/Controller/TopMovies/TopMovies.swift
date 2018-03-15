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
    
    var movies: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        let fetchRequest: NSFetchRequest<Movies> = Movies.fetchRequest()
        
        do
        {
            let movie = try PersistenceServices.context.fetch(fetchRequest)
            self.movies = movie
            self.movies.sort(){$0.releaseYear > $1.releaseYear}
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
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let lastElement = movies.count - 1
        if indexPath.row == lastElement {
          tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc : MovieDetails = segue.destination as? MovieDetails
        {
            vc.movie = sender as? Movies
        }
    }
    
}
