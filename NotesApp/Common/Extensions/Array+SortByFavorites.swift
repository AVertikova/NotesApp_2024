//
//  Array+SortByFavorites.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation
typealias SortedByFavorite = (common: [NoteModelProtocol], favorites: [NoteModelProtocol])

extension Array where Element == NoteModelProtocol {
    func sortByFavorite() -> SortedByFavorite {
        let common: [NoteModelProtocol] = self.filter{$0.favorite == false}
        let favorites: [NoteModelProtocol] = self.filter{$0.favorite == true}
        return (common, favorites)
    }
  }

