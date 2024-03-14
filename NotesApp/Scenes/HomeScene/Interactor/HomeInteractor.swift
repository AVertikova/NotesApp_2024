//
//  HomeInteractor.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation

import Foundation

class HomeInteractor: HomeInteractorPropertiesProtocol {
    weak var presenter: HomeInteractorToPresenterResponseProtocol?
    var storageManager: StorageManagerProtocol?
}

extension HomeInteractor: HomePresenterToInteractorRequestProtocol {
   
    func fetchNotesList(request: Notes.GetNotesData.Request) {
        var response = Notes.GetNotesData.Response()
        response.notes = storageManager?.fetchNotesList()
        presenter?.presentFetchedNotes(response: response)
    }
    
    func updateNotesList(request: Notes.GetNotesData.Request) {
        var response = Notes.GetNotesData.Response()
        response.notes = storageManager?.updateNotesList()
        presenter?.presentFetchedNotes(response: response)
    }
    
    func removeNote(request: Notes.PassNoteDetails.Request) {
        if let selectedNote = request.selectedNote {
            storageManager?.removeNote(noteToRemove: selectedNote)
        }
    }
    
    func favoriteStatusUpdate(request: Notes.PassNoteDetails.Request) {
        if let selectedNote = request.selectedNote {
            storageManager?.favoriteStatusUpdate(noteToUpdate: selectedNote)
        }
    }
}
