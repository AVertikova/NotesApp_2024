//
//  NoteModelProtocol.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

protocol NoteModelProtocol {
    var id: UUID {get set}
    var date: Date {get set}
    var userFormatDate: String? {get}
    var title: String? {get set}
    var body: String? {get set}
    var favorite: Bool {get set}
}
