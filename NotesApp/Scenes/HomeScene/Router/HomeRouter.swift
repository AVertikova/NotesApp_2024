//
//  HomeRouter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation
import UIKit

class HomeRouter: HomePresenterToRouterRequestProtocol {
    func pushToFavoritesScene(with request: Notes.GoToFavorites.Request) {
            let response = Notes.GoToFavorites.Response()
            let favoritesModule = FavoritesBuilder.createModule(with: response)
            if let nController = request.navigationController as? UINavigationController {
                nController.pushViewController(favoritesModule, animated: true)
            }
    }
    
    func pushToNoteDetailsScene(with request: Notes.PassNoteDetails.Request) {
            let response = Notes.PassNoteDetails.Response(selectedNote: request.selectedNote)
            let noteDetailsModule = NoteDetailsBuilder.createModule(with: response)
            if let nController = request.navigationController as? UINavigationController {
                nController.pushViewController(noteDetailsModule, animated: true)
            }
    }
}

extension HomeRouter: HomeActionsDelegate {
    func didTapFavorites(request: Notes.GoToFavorites.Request) {
        self.pushToFavoritesScene(with: request)
    }
    
    func didSelectOrAddNote(request: Notes.PassNoteDetails.Request) {
        self.pushToNoteDetailsScene(with: request)
    }
}
