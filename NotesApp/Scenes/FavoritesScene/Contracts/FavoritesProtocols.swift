//
//  FavoritesProtocols.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation
import UIKit

protocol FavoritesActionsDelegate: AnyObject {
    func didSelectNote(request: Notes.PassNoteDetails.Request)
}

protocol FavoritesViewPropertiesProtocol: AnyObject {
    var presenter: FavoritesViewToPresenterRequestProtocol? { get set }
}

protocol FavoritesPresenterPropertiesProtocol: AnyObject {
    var viewController: FavoritesPresenterToViewResponseProtocol? { get set }
    var interactor: FavoritesPresenterToInteractorRequestProtocol? { get set }
    var router: FavoritesPresenterToRouterRequestProtocol? { get set }
   
}

protocol FavoritesInteractorPropertiesProtocol: AnyObject {
    var presenter: FavoritesInteractorToPresenterResponseProtocol? { get set }
    var storageManager: StorageManagerProtocol? {get set}

}

// MARK: Favorites Interaction protocols

protocol FavoritesViewToPresenterRequestProtocol: AnyObject {
    func viewWillAppear()
    func viewDidLoad()
    func removeNoteAction(request: Notes.PassNoteDetails.Request)
    func favoriteStatusChanged(request: Notes.PassNoteDetails.Request)
}

protocol FavoritesPresenterToViewResponseProtocol: AnyObject {
    func displayNotes(viewModel: Favorites.GetFavoritesData.ViewModel)
}

protocol FavoritesPresenterToInteractorRequestProtocol: AnyObject {
    func fetchFavoritesList(request: Favorites.GetFavoritesData.Request)
    func updateFavoritesList(request: Favorites.GetFavoritesData.Request)
    func removeNote(request: Notes.PassNoteDetails.Request)
    func favoriteStatusUpdate(request: Notes.PassNoteDetails.Request)
}

protocol FavoritesInteractorToPresenterResponseProtocol: AnyObject {
    func presentFetchedFavorites(response: Favorites.GetFavoritesData.Response)
}

protocol FavoritesPresenterToRouterRequestProtocol: AnyObject {
    func pushToNoteDetailsScene(with request: Notes.PassNoteDetails.Request)
}
