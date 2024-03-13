//
//  FavoritesRouter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation
import UIKit

class FavoritesRouter: FavoritesPresenterToRouterRequestProtocol {
    
    func pushToNoteDetailsScene(with request: Notes.PassNoteDetails.Request) {
            let response = Notes.PassNoteDetails.Response(selectedNote: request.selectedNote)
            let noteDetailsModule = NoteDetailsBuilder.createModule(with: response)
            if let nController = request.navigationController as? UINavigationController {
                nController.pushViewController(noteDetailsModule, animated: true)
            }
        }
}

extension FavoritesRouter: FavoritesActionsDelegate {
    func didSelectNote(request: Notes.PassNoteDetails.Request) {
        self.pushToNoteDetailsScene(with: request)
    }
}
