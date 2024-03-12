//
//  NotesSorter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
typealias SortedByFavorite = (common: [NoteModelProtocol], favorite: [NoteModelProtocol])

class NotesSorter {
   class func sortByFavorite(notes: [NoteModelProtocol]) -> SortedByFavorite {
        let common: [NoteModelProtocol] = notes.filter{$0.favorite == false}
        let favorite: [NoteModelProtocol] = notes.filter{$0.favorite == true}
        return (common, favorite)
    }
}
