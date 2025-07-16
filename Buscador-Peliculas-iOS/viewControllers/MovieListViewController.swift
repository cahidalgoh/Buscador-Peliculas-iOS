//
//  ViewController.swift
//  Buscador-Peliculas-iOS
//
//  Created by Tardes on 16/7/25.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Indicamos al tableView su fuente de datos
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        searchMoviesByTitle(movieTitle: "superman")
    }
    
    func searchMoviesByTitle(movieTitle: String) {
        
        Task {
            movies = await MovieProvider.getMoviesByTitle(title: movieTitle)
            
            print(movies)
            // Una vez se han obtenido las recetas, volvemos al hilos principal
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMoviesByTitle(movieTitle: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMoviesByTitle(movieTitle: "superman")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieViewCell
        let movie = movies[indexPath.row]
        cell.render(with: movie)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailMovieVC = segue.destination as! MovieDetailViewController
    
        // Posición del elemento seleccionado
        let IndexPath = self.tableView.indexPathForSelectedRow!
        
        // Pelicula según el indexPath
        let movie = self.movies[IndexPath.row]
        
        // Pasamos el id de la película al detalle
        detailMovieVC.movieId = movie.imdbID
        
        // Deseleccionamos el item pulsado
        tableView.deselectRow(at: IndexPath, animated: true)
    }
    
}

