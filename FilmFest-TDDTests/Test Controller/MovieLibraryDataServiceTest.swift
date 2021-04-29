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
    
    let onePiece = Movie(title: "One Piece")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryTableView = UITableView()
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
}
