//
//  HomeViewController+TableView.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation
import UIKit

enum ActionImage: String {
    case remove = "trash"
    case addToFavorites = "heart.filled"
    case removeFromFavorites = "heart"
}

extension HomeViewController: UITableViewDelegate & UITableViewDataSource {
    
    func setupTableView() {
        notesTableView.initialize(cellClass: NoteCell.self, delegate: self, dataSource: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSource: [NoteModelProtocol]? = searchController.isSearching ? searchController.filteredNotes : dataSourceNotes
        return currentSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = notesTableView.dequeue(cellClass: NoteCell.self)
        let currentSource: [NoteModelProtocol]? = searchController.isSearching ? searchController.filteredNotes : dataSourceNotes
        if let note = currentSource?[indexPath.row] {
            noteCell.configure(with: note)
            noteCell.selectionStyle = .none
        }
        return noteCell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeAction = configureRemoveAction(with: indexPath)
        let config = UISwipeActionsConfiguration(actions: [removeAction])
        return config
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addToFavoriteAction = configureAddToFavoritesAction(with: indexPath)
        let config = UISwipeActionsConfiguration(actions: [addToFavoriteAction])
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSource: [NoteModelProtocol]? = searchController.isSearching ? searchController.filteredNotes : dataSourceNotes
        if let noteDetail = currentSource?[indexPath.row] {
            if let nController = navigationController {
                let request = Notes.PassNoteDetails.Request(navigationController: nController,
                                                            homeViewControllerDelegate: self,
                                                            selectedNote: noteDetail)
                noteAddOrUpdateDelegate?.didSelectOrAddNote(request: request)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    private func configureAddToFavoritesAction(with indexPath: IndexPath) -> UIContextualAction {
        let addToFavoriteAction = UIContextualAction(style: .normal, title: nil) {
            _,_,completion in
            self.updateFavoritesAction(with: indexPath)
            completion(true)
        }
        
        let currentSource: [NoteModelProtocol]? = self.searchController.isSearching ? self.searchController.filteredNotes : self.dataSourceNotes
        if let noteToUpdate = currentSource?[indexPath.row] {
            if noteToUpdate.favorite == false {
                addToFavoriteAction.configureActionView(with: .addToFavorites)
            } else {
                addToFavoriteAction.configureActionView(with: .removeFromFavorites)
            }
        }
        
        return addToFavoriteAction
    }
    
    private func configureRemoveAction(with indexPath: IndexPath) -> UIContextualAction {
        let removeAction = UIContextualAction(style: .normal, title: nil) {
            _,_,completion in
            self.removeNoteAction(at: indexPath)
            completion(true)
        }
        removeAction.configureActionView(with: .remove)
        
        return removeAction
    }
    
    private func removeNoteAction(at indexPath: IndexPath) {
        let currentSource: [NoteModelProtocol]? = self.searchController.isSearching ? self.searchController.filteredNotes : self.dataSourceNotes
        if let noteToRemove = currentSource?[indexPath.row] {
            self.removeNoteLocal(at: indexPath)
            let request = Notes.PassNoteDetails.Request(selectedNote: noteToRemove)
            self.presenter?.removeNoteAction(request: request)
            if self.searchController.isActive {
                self.updateSearchResults(for: self.searchController)
            }
        }
    }
    
    private func removeNoteLocal(at indexPath: IndexPath) {
        self.notesTableView.beginUpdates()
        if self.searchController.isSearching {
            self.searchController.filteredNotes?.remove(at: indexPath.row)
        } else {
            self.dataSourceNotes?.remove(at: indexPath.row)
        }
        self.notesTableView.deleteRows(at: [indexPath], with: .fade)
        self.notesTableView.endUpdates()
    }
    
    private func updateFavoritesAction(with indexPath: IndexPath) {
        let currentSource: [NoteModelProtocol]? = searchController.isSearching ? searchController.filteredNotes : dataSourceNotes
        if var noteUpdate = currentSource?[indexPath.row] {
            self.updateFavoritesLocal(at: indexPath)
            noteUpdate.favorite.toggle()
            if let nController = navigationController {
                let request = Notes.PassNoteDetails.Request(navigationController: nController,
                                                            homeViewControllerDelegate: self,
                                                            selectedNote: noteUpdate)
                noteAddOrUpdateDelegate?.didSelectOrAddNote(request: request)
            }
        }
    }
    
    private func updateFavoritesLocal(at indexPath: IndexPath) {
        self.removeNoteLocal(at: indexPath)
    }
    
    

}
