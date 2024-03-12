//
//  HomeBuilder.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
import UIKit

class HomeBuilder {
    static func createModule() -> HomeViewController {
        let vcId = String(describing: HomeViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = storyboard.instantiateViewController(withIdentifier: vcId) as?
            HomeViewController {
            let presenter: HomePresenterPropertiesProtocol &
            HomeViewToPresenterRequestProtocol &
            HomeInteractorToPresenterResponseProtocol = HomePresenter()
            let interactor: HomeInteractorPropertiesProtocol &
            HomePresenterToInteractorRequestProtocol = HomeInteractor()
            let router: HomePresenterToRouterRequestProtocol &
            HomeAddOrUpdateActionDelegate = HomeRouter()

            homeViewController.presenter = presenter
            homeViewController.noteAddOrUpdateDelegate = router
            presenter.viewController = homeViewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.storageManager = CoreDataManager.sharedManager

            return homeViewController
        }
        return HomeViewController()
    }
}
