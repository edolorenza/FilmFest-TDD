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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func test_Init_MoviesToSee_ReturnZero(){
        //sut = system under test
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func test_Init_MoviesSeen_ReturnZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }

}
