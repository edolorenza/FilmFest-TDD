//
//  MovieStructTest.swift
//  FilmFest-TDDTests
//
//  Created by Edo Lorenza on 28/04/21.
//

import XCTest
@testable import FilmFest_TDD


class MovieStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Initialization
    func testInit_MovieTitle() {
        let testMovie = Movie(title: "Avenger Endgame")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Avenger Endgame")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Captain America Winter: The Winter Soldier", releaseDate: "2014")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "2014")
    }
    
    //MARK: - Equatable
    func testEquatable_ReturnsTrue() {
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Action")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_NotEqualForDifferentTitles() {
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnNotEqualForDifferentReleaseDate() {
        let movie1 = Movie(title: "Action", releaseDate: "2019")
        let movie2 = Movie(title: "Action", releaseDate: "2020")
        
        XCTAssertNotEqual(movie1, movie2)
    }
}
