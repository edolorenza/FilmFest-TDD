//
//  Movie.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
