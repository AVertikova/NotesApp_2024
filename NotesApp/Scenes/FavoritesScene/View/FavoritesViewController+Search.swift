//
//  FavoritesViewController+Search.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation

import UIKit

extension FavoritesViewController:  UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterNotes(searchController.searchBar.text ?? "")
    }
    
    private func filterNotes(_ searchText: String) {
        searchController.filteredNotes = (dataSourceNotes?.filter({(note: NoteModelProtocol) -> Bool in
            return note.contains(text: searchText) }))!
        favoritesTableView.reloadData()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search favorite"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
}
