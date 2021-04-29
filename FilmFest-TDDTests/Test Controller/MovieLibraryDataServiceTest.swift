//
//  MovieLibraryDataServiceTest.swift
//  FilmFest-TDDTests
//
//  Created by Edo Lorenza on 29/04/21.
//

import XCTest
@testable import FilmFest_TDD

class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    
    let onePiece = Movie(title: "One Piece")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   //MARK: -Section
    
    func testTableViewSection_Count_ReturnTwo() {
    
        let section = libraryTableView.numberOfSections
        XCTAssertEqual(section, 2)
    }

    func testTableViewSection_SectionOne_ReturnsMovieToSeeCount() {
        sut.movieManager?.addMovie(movie: onePiece)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
        
    }
    
    func testTableViewSection_SectionTwo_ReturnsMovieSeeCount() {
        
        sut.movieManager?.addMovie(movie: onePiece)
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    //MARK: -Cell
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: darkComedy)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        sut.movieManager?.addMovie(movie: thriller)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.cellDequedProperly)
    }
}

extension MovieLibraryDataServiceTest {
    class TableViewMock: UITableView {
        var cellDequedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
}
