//
//  MovieManager.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import Foundation

class MovieManager {
    
    var moviesToSeeCount = 0
    let moviesSeenCount = 0
    
    private var moviesToSeeArray = [Movie]()
    
    func addMovie(movie: Movie){
        moviesToSeeCount += 1
        moviesToSeeArray.append(movie)
        
    }
    
    func MovieAtIndex(index: Int) -> Movie {
       return moviesToSeeArray[index]
    }
    
}
