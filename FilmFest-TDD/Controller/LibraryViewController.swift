//
//  ViewController.swift
//  FilmFest-TDD
//
//  Created by Edo Lorenza on 28/04/21.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
    }


}

