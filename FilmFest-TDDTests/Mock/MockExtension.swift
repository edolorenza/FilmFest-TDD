//
//  MockExtension.swift
//  FilmFest-TDDTests
//
//  Created by Edo Lorenza on 29/04/21.
//

import UIKit
@testable import FilmFest_TDD

extension MovieLibraryDataServiceTest {
    class TableViewMock: UITableView {
        var cellDequedProperly = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock{
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500))
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
}

