//
//  StorageManagerProtocol.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

protocol StorageManagerProtocol {
    func fetchNotesList() -> [NoteModelProtocol]
    func updateNotesList() -> [NoteModelProtocol]
    func saveNote(noteToSave: NoteModelProtocol)
    func updateNote(oldValue: NoteModelProtocol, newValue: NoteModelProtocol)
    func removeNote(noteToRemove: NoteModelProtocol)
}
