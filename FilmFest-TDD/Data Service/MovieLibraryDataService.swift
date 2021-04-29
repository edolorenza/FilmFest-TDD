//
//  MovieLibraryDataService.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else {return 0}
        
        return movieManager.moviesToSeeCount
    }
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

}
