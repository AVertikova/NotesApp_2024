//
//  FavoritesViewController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesViewPropertiesProtocol {
    var presenter: FavoritesViewToPresenterRequestProtocol?
    let searchController = NotesSearchController(searchResultsController: nil)
    var dataSourceNotes: [NoteModelProtocol]?
    var noteSelectedDelegate: FavoritesActionsDelegate?
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.setupTableView()
        presenter?.viewDidLoad()
    }
    
}

extension FavoritesViewController: FavoritesPresenterToViewResponseProtocol {
    func displayNotes(viewModel: Favorites.GetFavoritesData.ViewModel) {
        if viewModel.notes != nil {
            self.dataSourceNotes = viewModel.notes
            self.favoritesTableView.reloadData()
        }
    }
}
