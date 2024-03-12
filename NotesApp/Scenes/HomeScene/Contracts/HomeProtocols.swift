//
//  HomeProtocols.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
import UIKit

// MARK: Home Properties protocols

protocol UpdateHomeViewActionDelegate: AnyObject {
    func updateView()
}

protocol UpdateHomeViewDelegatePropertyProtocol: AnyObject {
    var backToHomeViewDelegate: UpdateHomeViewActionDelegate? {get set}
}

protocol HomeViewPropertiesProtocol: AnyObject {
    var presenter: HomeViewToPresenterRequestProtocol? { get set }
}
protocol HomeAddOrUpdateActionDelegate: AnyObject {
    func didSelectOrAddNote(request: Notes.PassNoteDetails.Request)
}

protocol HomeViewDelegatePropertyProtocol: AnyObject {
    var noteAddOrUpdateDelegate: HomeAddOrUpdateActionDelegate? {get set}
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
    func viewDidLoad()
    func removeNoteAction(request: Notes.PassNoteDetails.Request)
}

protocol HomePresenterToViewResponseProtocol: AnyObject {
    func displayNotes(viewModel: Notes.GetNotesData.ViewModel)
}

protocol HomePresenterToInteractorRequestProtocol: AnyObject {
    func fetchNotesList(request: Notes.GetNotesData.Request)
    func removeNote(request: Notes.PassNoteDetails.Request)
}

protocol HomeInteractorToPresenterResponseProtocol: AnyObject {
    func presentFetchedNotes(response: Notes.GetNotesData.Response)
}

protocol HomePresenterToRouterRequestProtocol: AnyObject {
    func pushToNoteDetailsScene(with request: Notes.PassNoteDetails.Request)
}
