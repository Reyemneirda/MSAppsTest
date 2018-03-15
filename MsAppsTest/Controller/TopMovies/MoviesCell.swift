//
//  MoviesCell.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 15/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var lbltitle : UILabel!
    @IBOutlet weak var lblratings : UILabel!
    @IBOutlet weak var moviePoster : UIImageView!
    
    func updateCells(movie: Movies)
    {
        self.lblratings.text = String(describing: movie.rating)
        self.lbltitle.text = movie.titles
        self.releaseDate.text = String(describing: movie.releaseYear)
        let stringRepresentation = movie.genres?.joined(separator: ",")
        self.genres.text = "Genre: \(stringRepresentation!)"
        self.moviePoster.sd_setImage(with: URL(string: movie.imageUrl!), completed: nil)
    }
    
}
