//
//  NoteCell.swift
//  NotesApp
//
//  Created by Анна Вертикова on 23.01.2024.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    func configure(with note: NoteModelProtocol) {
        dateLabel.text = note.userFormatDate
        titleLabel.text = note.title
        bodyLabel.text = note.body
        }
    }
