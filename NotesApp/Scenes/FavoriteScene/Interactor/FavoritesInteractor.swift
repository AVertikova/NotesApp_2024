//
//  FavoritesInteractor.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorPropertiesProtocol {
    var presenter: FavoritesInteractorToPresenterResponseProtocol?
    var storageManager: StorageManagerProtocol?
}

extension FavoritesInteractor: FavoritesPresenterToInteractorRequestProtocol {
    func fetchFavoritesList(request: Favorites.GetFavoritesData.Request) {
        var response = Favorites.GetFavoritesData.Response()
        response.notes = storageManager?.fetchNotesList()
        presenter?.presentFetchedFavorites(response: response)
    }
    
    func removeNote(request: Notes.PassNoteDetails.Request) {
        if let selectedNote = request.selectedNote {
            storageManager?.removeNote(noteToRemove: selectedNote)
        }
        self.updateFavoritesList()
    }
    
    func favoriteStatusUpdate(request: Notes.PassNoteDetails.Request) {
        if let selectedNote = request.selectedNote {
            storageManager?.favoriteStatusUpdate(noteToUpdate: selectedNote)
        }
        self.updateFavoritesList()
    }
    
    private func updateFavoritesList() {
        var response = Favorites.GetFavoritesData.Response()
        response.notes = storageManager?.updateNotesList()
        presenter?.presentFetchedFavorites(response: response)
    }
}
