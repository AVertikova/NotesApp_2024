//
//  NoteDetailsViewControllerTests.swift
//  NotesAppTests
//
//  Created by Анна Вертикова on 14.03.2024.
//

import XCTest
@testable import NotesApp

final class NoteDetailsViewControllerTests: XCTestCase {
    var sut: NoteDetailsViewController!

    override func setUpWithError() throws {
        let note = NoteDisplayModel(title: "New note", body: "New body")
        let response = Notes.PassNoteDetails.Response(selectedNote: note)
        sut = NoteDetailsBuilder.createModule(with: response)
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testNoteDetailsViewControllerNotNill() {
        XCTAssertNotNil(sut)
    }
    
    func testNoteDetailsTitleContainsText() {
        XCTAssertEqual(sut.noteTitleField.text, "New note")
    }
    
    func testNoteDetailsBodyContainsText() {
        XCTAssertEqual(sut.noteBodyField.text, "New body")
    }
    
    func testNoteDetailsViewControllerHasTitleLabel() {
        XCTAssertNotNil(sut.noteTitleField)
    }
    
    func testNoteDetailsViewControllerHasBodyLabel() {
        XCTAssertNotNil(sut.noteBodyField)
    }
}

