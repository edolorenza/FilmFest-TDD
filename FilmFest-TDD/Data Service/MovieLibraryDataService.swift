//
//  MovieLibraryDataService.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else {return 0}
        guard let librarySection = LibrarySection(rawValue: section) else {fatalError()}
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
      
    }
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

}
