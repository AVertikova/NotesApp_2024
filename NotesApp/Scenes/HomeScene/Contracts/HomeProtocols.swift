//
//  HomeProtocols.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
import UIKit

// MARK: Home Properties protocols

protocol HomeActionsDelegate: AnyObject {
    func didTapFavorites(request: Notes.GoToFavorites.Request)
    func didSelectOrAddNote(request: Notes.PassNoteDetails.Request)
}

protocol HomeViewPropertiesProtocol: AnyObject {
    var presenter: HomeViewToPresenterRequestProtocol? { get set }
}

protocol HomeViewDelegatePropertyProtocol: AnyObject {
    var actionsDelegate: HomeActionsDelegate? {get set}
}

protocol HomePresenterPropertiesProtocol: AnyObject {
    var viewController: HomePresenterToViewResponseProtocol? { get set }
    var interactor: HomePresenterToInteractorRequestProtocol? { get set }
    var router: HomePresenterToRouterRequestProtocol? { get set }
}

protocol HomeInteractorPropertiesProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterResponseProtocol? { get set }
    var storageManager: StorageManagerProtocol? {get set}
}

// MARK: Home Interaction protocols

protocol HomeViewToPresenterRequestProtocol: AnyObject {
    func viewWillAppear()
    func viewDidLoad()
    func removeNoteAction(request: Notes.PassNoteDetails.Request)
    func favoriteStatusChanged(request: Notes.PassNoteDetails.Request)
}

protocol HomePresenterToViewResponseProtocol: AnyObject {
    func displayNotes(viewModel: Notes.GetNotesData.ViewModel)
}

protocol HomePresenterToInteractorRequestProtocol: AnyObject {
    func fetchNotesList(request: Notes.GetNotesData.Request)
    func updateNotesList(request: Notes.GetNotesData.Request)
    func removeNote(request: Notes.PassNoteDetails.Request)
    func favoriteStatusUpdate(request: Notes.PassNoteDetails.Request) 
}

protocol HomeInteractorToPresenterResponseProtocol: AnyObject {
    func presentFetchedNotes(response: Notes.GetNotesData.Response)
}

protocol HomePresenterToRouterRequestProtocol: AnyObject {
    func pushToFavoritesScene(with request: Notes.GoToFavorites.Request) 
    func pushToNoteDetailsScene(with request: Notes.PassNoteDetails.Request)
}
