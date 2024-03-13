//
//  NotesSearchController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

class NotesSearchController: UISearchController {
    var filteredNotes: [NoteModelProtocol]?
    var isSearchBarEmpty: Bool {
      return self.searchBar.text?.isEmpty ?? true
    }
    var isSearching: Bool {
        return !isSearchBarEmpty && self.isActive
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
