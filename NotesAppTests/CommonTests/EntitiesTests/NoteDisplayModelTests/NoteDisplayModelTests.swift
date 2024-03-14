//
//  NoteDisplayModelTests.swift
//  NotesAppTests
//
//  Created by Анна Вертикова on 13.03.2024.
//

import XCTest
@testable import NotesApp
import CoreData

final class NoteDisplayModelTests: XCTestCase {

    func testNewNoteNotNill() {
        let note = NoteDisplayModel()
        XCTAssertNotNil(note)
    }
    
    func testNewNoteWithTitleNotNill() {
        let note = NoteDisplayModel(title: "New title")
        XCTAssertTrue(note.title == "New title")
        XCTAssertTrue(note.body == " ")
    }
    
    func testNoteInitWithNotesItemEntity() {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if let entity = NSEntityDescription.insertNewObject(forEntityName: "NotesItem", into: context) as? NotesItem {
            entity.setValue(UUID(), forKey: "id")
            entity.setValue(Date(), forKey: "date")
            entity.setValue("Test title", forKey: "title")
            entity.setValue("Test body", forKey: "body")
            let note = NoteDisplayModel(with: entity)
            
            XCTAssertTrue(note.title == entity.title)
            XCTAssertTrue(note.id == entity.id)
            XCTAssertTrue(note.date == entity.date)
            XCTAssertTrue(note.userFormatDate == entity.date?.convert(for: .user))
        }
    }
    
    func testNoteContainsText() {
        let note = NoteDisplayModel(title: "New title")
        XCTAssertTrue(note.contains(text: "New"))
        XCTAssertTrue(note.contains(text: "new"))
        XCTAssertFalse(note.contains(text: "Old"))
    }

}
