//
//  NoteProtocols.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation
import UIKit

// MARK: NoteDetails Properties protocols

protocol NoteDetailsViewPropertiesProtocol: AnyObject {
    var presenter: NoteDetailsViewToPresenterRequestProtocol? { get set }
}

protocol NoteDetailsPresenterPropertiesProtocol: AnyObject {
    var viewController: NoteDetailsPresenterToViewResponseProtocol? { get set }
    var interactor: NoteDetailsPresenterToInteractorRequestProtocol? { get set }
    var selectedNote: NoteModelProtocol? {get set}
}

protocol NoteDetailsInteractorPropertiesProtocol: AnyObject {
    var presenter: NoteDetailsInteractorToPresenterResponseProtocol? { get set }
    var storageManager: StorageManagerProtocol? {get set}

}

// MARK: NoteDetails Interaction protocols

protocol NoteDetailsViewToPresenterRequestProtocol: AnyObject {
    func saveNoteButtonTapped(request: Note.NoteAddedOrUpdated.Request)
    func fetchNoteDetails()
}

protocol NoteDetailsPresenterToViewResponseProtocol: AnyObject {
    func displayNoteDetails(viewModel: Note.GetNoteDetailsData.ViewModel)
}

protocol NoteDetailsPresenterToInteractorRequestProtocol: AnyObject {
    func updateOrSaveNote(request: Note.NoteAddedOrUpdated.UpdateOrSaveRequest)
    func saveNote(noteToSave: NoteModelProtocol)
    func updateNote(oldValue: NoteModelProtocol, newValue: NoteModelProtocol)
    func fetchNoteDetails(request: Note.GetNoteDetailsData.Request)
}

protocol NoteDetailsInteractorToPresenterResponseProtocol: AnyObject {
    func presentFetchedNoteDetails(response: Note.GetNoteDetailsData.Response)
}

protocol NoteDetailsPresenterToRouterRequestProtocol: AnyObject {
}
