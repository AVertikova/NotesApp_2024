//
//  FavoritesViewControllerTests.swift
//  NotesAppTests
//
//  Created by Анна Вертикова on 14.03.2024.
//

import XCTest
@testable import NotesApp



final class FavoritesViewControllerTests: XCTestCase {
    var sut: FavoritesViewController!

    override func setUpWithError() throws {
        sut = FavoritesBuilder.createModule(with: Notes.GoToFavorites.Response())
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFavoritesViewControllerNotNill() {
        XCTAssertNotNil(sut)
    }

    func testFavoritesTableViewNotNill() {
        XCTAssertNotNil(sut?.favoritesTableView)
    }
    
    func testFavoritesTableViewDelegateIsFavoritesViewController() {
        XCTAssertTrue(sut?.favoritesTableView.delegate is FavoritesViewController)
    }
    
    func testFavoritesTableViewDataSourceIsFavoritesViewController() {
        XCTAssertTrue(sut?.favoritesTableView.dataSource is FavoritesViewController)
    }
}
