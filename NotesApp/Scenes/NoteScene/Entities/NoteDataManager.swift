//
//  NoteDataManager.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import Foundation

struct Note {

    enum GetNoteDetailsData {
        struct Request {
            var note: NoteModelProtocol?
        }

        struct Response {
            var note: NoteModelProtocol?
        }

        struct ViewModel {
            var note: NoteModelProtocol?
        }
    }

    enum NoteAddedOrUpdated {
        struct Request {
            var currentNote: NoteModelProtocol?
        }

        struct UpdateOrSaveRequest {
            var oldValueNote: NoteModelProtocol?
            var newValueNote: NoteModelProtocol?
        }

        struct Response {
            var note: NoteModelProtocol?
        }

        struct ViewModel {
            var note: NoteModelProtocol?
        }
    }

}
