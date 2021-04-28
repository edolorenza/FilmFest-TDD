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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
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
}
