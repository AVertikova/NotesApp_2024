//
//  UITableView+Extensions.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import UIKit

extension UITableView {

    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil),
                      forCellReuseIdentifier: String(describing: Cell.self))
    }

    func dequeue<Cell: UITableViewCell>(cellClass: Cell.Type) -> Cell {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }

    func initialize<Cell: UITableViewCell>(cellClass: Cell.Type,
                                           delegate: UITableViewDelegate? = nil,
                                           dataSource: UITableViewDataSource? = nil,
                                           headerView: UIView? = nil,
                                           footerView: UIView? = UIView()) {
        self.registerCellNib(cellClass: cellClass)
        self.delegate = delegate
        self.dataSource = dataSource
        self.tableHeaderView = headerView
        self.tableFooterView = footerView
    }
}
