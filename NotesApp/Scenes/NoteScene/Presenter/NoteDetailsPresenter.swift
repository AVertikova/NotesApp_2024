//
//  NoteDetailsPresenter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation

class NoteDetailsPresenter: NoteDetailsPresenterPropertiesProtocol {
    var selectedNote: NoteModelProtocol?
    weak var viewController: NoteDetailsPresenterToViewResponseProtocol?
    var interactor: NoteDetailsPresenterToInteractorRequestProtocol?
}

extension NoteDetailsPresenter: NoteDetailsViewToPresenterRequestProtocol {
    
    func saveNoteButtonTapped(request: Note.NoteAddedOrUpdated.Request) {
        let updateOrSaveRequest = Note.NoteAddedOrUpdated.UpdateOrSaveRequest(oldValueNote: selectedNote, newValueNote: request.currentNote)
        interactor?.updateOrSaveNote(request: updateOrSaveRequest)
    }

    func fetchNoteDetails() {
        let request = Note.GetNoteDetailsData.Request(note: selectedNote)
        interactor?.fetchNoteDetails(request: request)
    }
}

extension NoteDetailsPresenter: NoteDetailsInteractorToPresenterResponseProtocol {
    
    func presentFetchedNoteDetails(response: Note.GetNoteDetailsData.Response) {
        let viewModel = Note.GetNoteDetailsData.ViewModel(note: response.note)
        viewController?.displayNoteDetails(viewModel: viewModel)
    }
}
