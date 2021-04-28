//
//  MovieManagerTest.swift
//  FilmFest-TDDTests
//
//  Created by Edo Lorenza on 28/04/21.
//

import XCTest
@testable import FilmFest_TDD

class MovieManagerTest: XCTestCase {

    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let actionMovie = Movie(title: "Action/Adventure")
    let artHouseMovie = Movie(title: "Arthouse Drama")
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Initial Values
   func test_Init_MoviesToSee_ReturnZero(){
        //sut = system under test
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func test_Init_MoviesSeen_ReturnZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: - Add & Query
    func test_Init_MoviesToSee_ReturnOne(){
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        sut.addMovie(movie: artHouseMovie)

        let movieQueried = sut.MovieAtIndex(index: 0)
        XCTAssertEqual(artHouseMovie.title, movieQueried.title)
        
    }

    //MARK: - Checking movie
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.MovieAtIndex(index: 0).title, artHouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    //MARK: - Clearing & Reseting
    func testClearArrays_ReturnsArrayCountZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
    
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: -Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
    }
    
}
