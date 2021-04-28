//
//  MovieLibraryDataService.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}
