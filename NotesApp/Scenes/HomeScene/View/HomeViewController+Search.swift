//
//  HomeViewController+Search.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation
import UIKit

extension HomeViewController:  UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterNotes(searchController.searchBar.text ?? "")
    }
    
    private func filterNotes(_ searchText: String) {
        searchController.filteredNotes = (dataSourceNotes?.filter({(note: NoteModelProtocol) -> Bool in
            return note.body?.lowercased().contains(searchText.lowercased()) ?? false || 
                   note.title?.lowercased().contains(searchText.lowercased()) ?? false }))!
        notesTableView.reloadData()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search note"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
}
