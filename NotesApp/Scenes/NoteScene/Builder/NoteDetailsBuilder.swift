//
//  NoteBuilder.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation
import UIKit

class NoteDetailsBuilder {
    static func createModule(with response: Notes.PassNoteDetails.Response) -> NoteDetailsViewController {
        let vcId = String(describing: NoteDetailsViewController.self)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let noteDetailsViewController =  mainStoryboard.instantiateViewController(withIdentifier: vcId) as!
                       NoteDetailsViewController
        let presenter: NoteDetailsPresenterPropertiesProtocol &
                       NoteDetailsViewToPresenterRequestProtocol &
                       NoteDetailsInteractorToPresenterResponseProtocol = NoteDetailsPresenter()
        let interactor: NoteDetailsInteractorPropertiesProtocol &
                        NoteDetailsPresenterToInteractorRequestProtocol = NoteDetailsInteractor()

        noteDetailsViewController.presenter = presenter
        presenter.viewController = noteDetailsViewController
        presenter.interactor = interactor
        presenter.selectedNote = response.selectedNote
        interactor.presenter = presenter
        interactor.storageManager = CoreDataManager.sharedManager

        return noteDetailsViewController
    }
}
