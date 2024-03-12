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

    func removeNoteAction(request: Notes.PassNoteDetails.Request) {
        interactor?.removeNote(request: request)
    }
}

extension HomePresenter: HomeInteractorToPresenterResponseProtocol {
    
    func presentFetchedNotes(response: Notes.GetNotesData.Response) {
        if let notesToSort = response.notes {
            let sorted = NotesSorter.sortByFavorite(notes: notesToSort)
            let viewModel = Notes.GetNotesData.ViewModel(common: sorted.common, favorite: sorted.favorite)
            viewController?.displayNotes(viewModel: viewModel)
        }
    }
}
