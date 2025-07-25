//
//  MovieDetailViewController.swift
//  Buscador-Peliculas-iOS
//
//  Created by Tardes on 16/7/25.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageVieMovieDetail: UIImageView!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelGenero: UILabel!
    @IBOutlet weak var labelPais: UILabel!
    @IBOutlet weak var labelDirector: UILabel!
    @IBOutlet weak var labelDuracion: UILabel!
    @IBOutlet weak var textViewSinopsis: UITextView!
    
    var movieId: String!
    var movie : Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //navigationItem.title = "Detalles de la Película" + movieId
        
        searchMoviesByTitle()

    }

    func searchMoviesByTitle() {
        
        Task {
            movie = await MovieProvider.getMoviesById(id: movieId)
            
            DispatchQueue.main.async {
                self.navigationItem.title = self.movie?.Title
                self.imageVieMovieDetail.loadImageFromURL(url: URL(string: (self.movie?.Poster)!)!)
                self.labelYear.text = self.movie?.Year
                self.labelGenero.text = self.movie?.Genre
                self.labelPais.text = self.movie?.Country
                self.labelDirector.text = self.movie?.Director
                self.labelDuracion.text = self.movie?.Runtime
                self.textViewSinopsis.text = self.movie?.Plot
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
