//
//  StorageManagerProtocol.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

protocol StorageManagerProtocol {
    var onboardingPassed: Bool { get set }
    func fetchNotesList() -> [NoteModelProtocol]
    func saveNote(noteToSave: NoteModelProtocol)
    func updateNote(oldValue: NoteModelProtocol, newValue: NoteModelProtocol)
    func favoriteStatusUpdate(noteToUpdate: NoteModelProtocol)
    func removeNote(noteToRemove: NoteModelProtocol)
}
