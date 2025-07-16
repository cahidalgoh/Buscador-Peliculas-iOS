//
//  MovieViewCell.swift
//  Buscador-Peliculas-iOS
//
//  Created by Tardes on 16/7/25.
//

import UIKit

class MovieViewCell: UITableViewCell {
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!

    func render(with movie: Movie) {
        labelMovieTitle.text = movie.Title
        imageViewMovie.loadImageFromURL(url: URL(string: movie.Poster)!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
