//
//  HomeDataManager.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

struct Notes {
    enum GetNotesData {
        struct Request {}

        struct Response {
            var notes: [NoteModelProtocol]?
        }

        struct ViewModel {
            var common: [NoteModelProtocol]?
            var favorite: [NoteModelProtocol]?
        }
    }

    enum PassNoteDetails {
        struct Request {
            var navigationController: Any?
            var homeViewControllerDelegate: Any?
            var selectedNote: NoteModelProtocol?
        }

        struct Response {
            var homeViewControllerDelegate: Any?
            var selectedNote: NoteModelProtocol?
        }

        struct ViewModel {
            var selectedNote: NoteModelProtocol
        }
    }
}
