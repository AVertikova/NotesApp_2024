//
//  HomeViewController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

class HomeViewController: UIViewController, HomeViewPropertiesProtocol, HomeViewDelegatePropertyProtocol {
    var presenter: HomeViewToPresenterRequestProtocol?
    var noteAddOrUpdateDelegate: HomeAddOrUpdateActionDelegate?
    let searchController = HomeSearchController(searchResultsController: nil)
    var dataSourceNotes: [NoteModelProtocol]?
    var currentViewModel = Notes.GetNotesData.ViewModel()
    private var showFavorite: Bool = false
    
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.setupTableView()
        presenter?.viewDidLoad()
    }
    
    @IBAction func newNoteButtonTapped(_ sender: Any) {
        if let nController = navigationController {
            let request = Notes.PassNoteDetails.Request(navigationController: nController,
                                                        homeViewControllerDelegate: self,
                                                        selectedNote: nil)
            noteAddOrUpdateDelegate?.didSelectOrAddNote(request: request)
        }
    }
  
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        showFavorite.toggle()
        if (showFavorite) {
            favoriteButton.image = UIImage(named: "heart.filled")
            self.displayFavoriteNotes(viewModel: currentViewModel)
        }
        
    }
    
}

extension HomeViewController: HomePresenterToViewResponseProtocol {
    func displayNotes(viewModel: Notes.GetNotesData.ViewModel) {
        if viewModel.common != nil {
            self.dataSourceNotes = viewModel.common
            self.currentViewModel = viewModel
            self.notesTableView.reloadData()
        }
    }
    
    func displayFavoriteNotes(viewModel: Notes.GetNotesData.ViewModel) {
        if viewModel.favorite != nil {
            self.dataSourceNotes = viewModel.favorite
            self.notesTableView.reloadData()
        }
    }
}

extension HomeViewController: UpdateHomeViewActionDelegate {
    func updateView() {
        presenter?.viewDidLoad()
    }
}
