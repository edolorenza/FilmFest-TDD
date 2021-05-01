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
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Iron Man", releaseDate: "2008"))
        dataService.movieManager?.addMovie(movie: Movie(title: "The Incredible Hulk", releaseDate: "2008"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Captain America: The First Avenger", releaseDate: "2011"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Avenger Assemble"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Thor: The Dark World"))
        
        libraryTableView.reloadData()
    }


}

