//
//  NoteDetailsInteractor.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation

class NoteDetailsInteractor: NoteDetailsInteractorPropertiesProtocol {
    weak var presenter: NoteDetailsInteractorToPresenterResponseProtocol?
    var storageManager: StorageManagerProtocol?
}

extension NoteDetailsInteractor: NoteDetailsPresenterToInteractorRequestProtocol {
    
    func saveNote(noteToSave: NoteModelProtocol) {
        storageManager?.saveNote(noteToSave: noteToSave)
    }
    
    func updateNote(oldValue: NoteModelProtocol, newValue: NoteModelProtocol) {
        storageManager?.updateNote(oldValue: oldValue, newValue: newValue)
    }
    
    func updateOrSaveNote(request: Note.NoteAddedOrUpdated.UpdateOrSaveRequest) {
        if let oldValue = request.oldValueNote, let newValue = request.newValueNote {
            self.updateNote(oldValue: oldValue, newValue: newValue)
        } else {
            if let noteToSave = request.newValueNote {
                self.saveNote(noteToSave: noteToSave)
            }
        }
    }
    
    func fetchNoteDetails(request: Note.GetNoteDetailsData.Request) {
        let response = Note.GetNoteDetailsData.Response(note: request.note)
        presenter?.presentFetchedNoteDetails(response: response)
    }
}
