//
//  MovieDetails.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit

class MovieDetails: BaseViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var yearReleased: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.topItem?.title = self.movie?.titles
        displayMovieInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func displayMovieInfo()
    {
        
        guard let rating = movie?.rating,
            let releaseYear = movie?.releaseYear else {return}
        self.rating.text = String(rating)
        self.yearReleased.text = String(releaseYear)
        let stringRepresentation = movie?.genres?.joined(separator: ",")
        self.genre.text = "Genre: \(stringRepresentation!)"
        self.moviePoster.sd_setImage(with: URL(string: (movie?.imageUrl!)!), completed: nil)
    }
    


}
