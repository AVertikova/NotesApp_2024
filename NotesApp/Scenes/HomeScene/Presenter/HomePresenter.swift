//
//  HomePresenter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterPropertiesProtocol {
    weak var viewController: HomePresenterToViewResponseProtocol?
    var interactor: HomePresenterToInteractorRequestProtocol?
    var router: HomePresenterToRouterRequestProtocol?
}

extension HomePresenter: HomeViewToPresenterRequestProtocol {
    func viewDidLoad() {
        let request = Notes.GetNotesData.Request()
        interactor?.fetchNotesList(request: request)
    }
    
    func viewWillAppear() {
        let request = Notes.GetNotesData.Request()
        interactor?.updateNotesList(request: request)
    }

    func removeNoteAction(request: Notes.PassNoteDetails.Request) {
        interactor?.removeNote(request: request)
    }
    
    func favoriteStatusChanged(request: Notes.PassNoteDetails.Request) {
        interactor?.favoriteStatusUpdate(request: request)
    }
}

extension HomePresenter: HomeInteractorToPresenterResponseProtocol {
    
    func presentFetchedNotes(response: Notes.GetNotesData.Response) {
        if let notes = response.notes {
            let sorted = notes.sortByFavorite()
            let viewModel = Notes.GetNotesData.ViewModel(notes: sorted.common)
            viewController?.displayNotes(viewModel: viewModel)
        }
    }
}
