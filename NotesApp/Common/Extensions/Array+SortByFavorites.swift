//
//  Array+SortByFavorites.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation
typealias SortedByFavorite = (common: [NoteModelProtocol], favorite: [NoteModelProtocol])

extension Array where Element == NoteModelProtocol {
    func sortByFavorite() -> SortedByFavorite {
        let common: [NoteModelProtocol] = self.filter{$0.favorite == false}
        let favorite: [NoteModelProtocol] = self.filter{$0.favorite == true}
        return (common, favorite)
    }
  }

