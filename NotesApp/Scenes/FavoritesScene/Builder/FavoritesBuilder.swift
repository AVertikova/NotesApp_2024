//
//  FavoritesBuilder.swift
//  NotesApp
//
//  Created by Анна Вертикова on 13.03.2024.
//

import Foundation
import UIKit

class FavoritesBuilder {
    static func createModule(with response: Notes.GoToFavorites.Response) -> FavoritesViewController {
        let vcId = String(describing: FavoritesViewController.self)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let favoritesViewController =  mainStoryboard.instantiateViewController(withIdentifier: vcId) as!
        FavoritesViewController
        let presenter: FavoritesPresenterPropertiesProtocol &
                       FavoritesViewToPresenterRequestProtocol &
                       FavoritesInteractorToPresenterResponseProtocol = FavoritesPresenter()
        let interactor: FavoritesInteractorPropertiesProtocol &
                        FavoritesPresenterToInteractorRequestProtocol = FavoritesInteractor()
        let router: FavoritesPresenterToRouterRequestProtocol&FavoritesActionsDelegate = FavoritesRouter()

        favoritesViewController.presenter = presenter
        favoritesViewController.noteSelectedDelegate = router
        presenter.viewController = favoritesViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.storageManager = CoreDataManager.sharedManager
    
        return favoritesViewController
    }
}

