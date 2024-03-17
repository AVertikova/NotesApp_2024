//
//  HomeViewController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

class HomeViewController: UIViewController, HomeViewPropertiesProtocol, HomeViewDelegatePropertyProtocol {
    var presenter: HomeViewToPresenterRequestProtocol?
    var actionsDelegate: HomeActionsDelegate?
    let searchController = NotesSearchController(searchResultsController: nil)
    var dataSourceNotes: [NoteModelProtocol]?
    
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.setupTableView()
        presenter?.viewDidLoad()
    }
    
    @IBAction func newNoteButtonTapped(_ sender: Any) {
        if let nController = navigationController {
            let request = Notes.PassNoteDetails.Request(navigationController: nController,
                                                        selectedNote: nil)
            actionsDelegate?.didSelectOrAddNote(request: request)
        }
    }
  
    @IBAction func favoriteButtonTapped(_ sender: Any){
        if let nController = navigationController {
            let request = Notes.GoToFavorites.Request(navigationController: nController)
            actionsDelegate?.didTapFavorites(request: request)
        }
    }
}

extension HomeViewController: HomePresenterToViewResponseProtocol {
    
    func displayNotes(viewModel: Notes.GetNotesData.ViewModel) {
        if viewModel.notes != nil {
            self.dataSourceNotes = viewModel.notes
            self.setFavoritesIconImage(with: viewModel.favoritesEmpty)
            self.notesTableView.reloadData()
        }
    }
    
    private func setFavoritesIconImage(with isEmpty: Bool) {
        favoriteButton.image = isEmpty ?  
        UIImage(systemName: ActionImage.favoriteIsFalse.rawValue) :
        UIImage(systemName: ActionImage.favoriteIsTrue.rawValue)
    }
}
