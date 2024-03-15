//
//  HomeViewControllerTests.swift
//  NotesAppTests
//
//  Created by Анна Вертикова on 13.03.2024.
//

import XCTest
@testable import NotesApp

final class HomeViewControllerTests: XCTestCase {
    var sut: HomeViewController!

    override func setUpWithError() throws {
        sut = HomeBuilder.createModule()
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHomeViewControllerNotNill() {
        XCTAssertNotNil(sut)
    }

    func testNotesTableViewNotNill() {
        XCTAssertNotNil(sut?.notesTableView)
    }
    
    func testNotesTableViewDelegateIsHomeViewController() {
        XCTAssertTrue(sut?.notesTableView.delegate is HomeViewController)
    }
    
    func testNotesTableViewDataSourceIsHomeViewController() {
        XCTAssertTrue(sut?.notesTableView.dataSource is HomeViewController)
    }
}

