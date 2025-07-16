//
//  MovieResponse.swift
//  Buscador-Peliculas-iOS
//
//  Created by Tardes on 16/7/25.
//

import Foundation

struct MovieResponse: Codable {
    let Search: [Movie]
}

struct Movie: Codable {

    let imdbID: String
    let Title: String
    let Poster: String
    let Year: String
    let Plot: String?
    let Runtime: String?
    let Director: String?
    let Genre: String?
    let Country: String?

}
