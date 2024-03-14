//
//  FavoritesDataManager.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation

struct Favorites {
    enum GetFavoritesData {
        struct Request {}
        
        struct Response {
            var notes: [NoteModelProtocol]?
        }
        
        struct ViewModel {
            var notes: [NoteModelProtocol]?
        }
    }
}
