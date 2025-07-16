//
//  MovieProvider.swift
//  Buscador-Peliculas-iOS
//
//  Created by Tardes on 16/7/25.
//

import Foundation

class MovieProvider {
    
    static let BASE_URL = "https://www.omdbapi.com/?apikey=f23771c0&"
        
    static func getMoviesByTitle(title: String) async -> [Movie]{
        // URL para la búqueda de las películas
        guard let url = URL(string: "\(MovieProvider.BASE_URL)s=\(title)") else {
            return[]
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Devolvemos las películas
            return try JSONDecoder().decode(MovieResponse.self, from: data).Search
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    static func getMoviesById(id: String) async -> Movie? {
        // URL para la búqueda de las películas
        guard let url = URL(string: "\(MovieProvider.BASE_URL)i=\(id)") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Devolvemos las películas
            return try JSONDecoder().decode(Movie.self, from: data)
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
