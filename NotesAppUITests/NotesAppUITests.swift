//
//  NotesAppUITests.swift
//  NotesAppUITests
//
//  Created by Анна Вертикова on 11.03.2024.
//

import XCTest

final class NotesAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAddNewNote() throws {
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["Notes"].buttons["Add"]
        let saveButton = app.navigationBars["Add new note"].buttons["Save"]
        let titleField = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        addButton.tap()
        titleField.tap()
        titleField.typeText("NewTestTitle")
        saveButton.tap()
        XCTAssertTrue(app.tables.staticTexts["NewTestTitle"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
