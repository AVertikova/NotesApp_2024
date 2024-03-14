//
//  FavoritesPresenter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation

class FavoritesPresenter: FavoritesPresenterPropertiesProtocol {
    var viewController: FavoritesPresenterToViewResponseProtocol?
    var interactor: FavoritesPresenterToInteractorRequestProtocol?
    var router: FavoritesPresenterToRouterRequestProtocol?
}

extension FavoritesPresenter: FavoritesViewToPresenterRequestProtocol {
   
    func viewWillAppear() {
        let request = Favorites.GetFavoritesData.Request()
        interactor?.updateFavoritesList(request: request)
    }
    
    func viewDidLoad() {
        let request = Favorites.GetFavoritesData.Request()
        interactor?.fetchFavoritesList(request: request)
    }
    
    func removeNoteAction(request: Notes.PassNoteDetails.Request) {
        interactor?.removeNote(request: request)
    }
    
    func favoriteStatusChanged(request: Notes.PassNoteDetails.Request) {
        interactor?.favoriteStatusUpdate(request: request)
    }
}

extension FavoritesPresenter: FavoritesInteractorToPresenterResponseProtocol {
    func presentFetchedFavorites(response: Favorites.GetFavoritesData.Response) {
        if let notes = response.notes {
            let sorted = notes.sortByFavorite()
            let viewModel = Favorites.GetFavoritesData.ViewModel(notes: sorted.favorite)
            viewController?.displayNotes(viewModel: viewModel)
        }
    }
}
