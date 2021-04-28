//
//  LibraryViewControllerTest.swift
//  FilmFest-TDDTests
//
//  Created by Edo Lorenza on 28/04/21.
//

import XCTest
@testable import FilmFest_TDD

class LibraryViewControllerTest: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: -Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil(){
        
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK: -Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: -Delegate
    func testDelegate_ViewDidLoad_SetsDelegate(){
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: -Data Service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject(){
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
    
}
