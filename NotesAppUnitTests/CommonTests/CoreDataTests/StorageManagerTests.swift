//
//  StorageManagerTests.swift
//  NotesAppTests
//
//  Created by Анна Вертикова on 13.03.2024.
//

import XCTest
@testable import NotesApp

final class StorageManagerTests: XCTestCase {
    var sut: CoreDataManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CoreDataManager.sharedManager
    }

    override func tearDownWithError() throws {
        removeAllNotes()
        sut = nil
    }

    func testStoreManagerInit() {
        XCTAssertNotNil(sut)
    }
    
    func testStorageManagerRemoveNote() {
        removeAllNotes()
        sut.saveNote(noteToSave: NoteDisplayModel(title: "First note"))
        sut.saveNote(noteToSave: NoteDisplayModel(title: "Second note"))
        let updatedNotesList = sut.updateNotesList()
        XCTAssertEqual(updatedNotesList.count, 2)
        
        let noteToRemove = updatedNotesList.first(where: { $0.title == "Second note"})!
        sut.removeNote(noteToRemove: noteToRemove)
        let updatedListAfterRemove = sut.updateNotesList()
        XCTAssertEqual(updatedListAfterRemove.count, 1)
    }
    
    func testStoreManagerSaveNote() {
        let uuid = UUID()
        sut.saveNote(noteToSave: NoteDisplayModel(id: uuid, title: "Test note"))
        let updatedNotes: [NoteModelProtocol] = sut.updateNotesList()
        let newNoteSaved = updatedNotes.contains(where: { $0.id == uuid})
        XCTAssertTrue(newNoteSaved)
    }
    
    func testDefaultNoteIsLoaded() {
        removeAllNotes()
        let fetchAtFirstLaunch: [NoteModelProtocol] = sut.fetchNotesList()
        XCTAssertEqual(fetchAtFirstLaunch.count, 1)
        
    }
    
    func testUpdateNoteListWithoutDefaultNote() {
        removeAllNotes()
        sut.saveNote(noteToSave: NoteDisplayModel(id: UUID(), title: "Test note"))
        let updatedNotes: [NoteModelProtocol] = sut.updateNotesList()
        XCTAssertEqual(updatedNotes.count, 1)
        XCTAssertNotNil(updatedNotes.contains(where: { $0.title == "Test note"}))
    
    }
    
    func testUpdateNote() {
        removeAllNotes()
        let oldValue = NoteDisplayModel(id: UUID(), title: "Old test note")
        let newValue = NoteDisplayModel(id: UUID(), title: "New test note")
        sut.saveNote(noteToSave: oldValue)
        let fetchOld: [NoteModelProtocol] = sut.fetchNotesList()
        XCTAssertEqual(fetchOld.count, 1)
        
        sut.updateNote(oldValue: oldValue , newValue: newValue)
        let fetchNew: [NoteModelProtocol] = sut.fetchNotesList()
        XCTAssertEqual(fetchOld.count, 1)
        XCTAssertEqual(fetchNew[0].title, "New test note")
    }
    
    func testFavoriteStatusUpdate() {
        removeAllNotes()
        var note = NoteDisplayModel()
        XCTAssertFalse(note.favorite)
        sut.saveNote(noteToSave: note)
        let fetchSaved: [NoteModelProtocol] = sut.fetchNotesList()
        XCTAssertEqual(fetchSaved.count, 1)
        XCTAssertFalse(fetchSaved[0].favorite)
        
        note.favorite.toggle()
        sut.favoriteStatusUpdate(noteToUpdate: note)
        let fetchUpdated: [NoteModelProtocol] = sut.fetchNotesList()
        XCTAssertEqual(fetchUpdated.count, 1)
        XCTAssertTrue(fetchUpdated[0].favorite)
    }
}

extension StorageManagerTests {
  private  func removeAllNotes() {
        let notes = sut.fetchNotesList()
        for note in notes {
            sut.removeNote(noteToRemove: note)
        }
    }
}
