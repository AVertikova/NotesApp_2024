//
//  NoteDisplayModel.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

import UIKit

struct NoteDisplayModel: NoteModelProtocol {
    var id = UUID()
    var date = Date()
    var userFormatDate: String?
    var title: String?
    var body: String?
    var favorite: Bool = false
    

    init() {}

    init(id: UUID = UUID(),
         date: Date = Date(),
         userFormatDate: String = Date().convert(for: .user),
         title: String = " ",
         body: String = " ", 
         favorite: Bool = false) {
        self.id = id
        self.date = date
        self.userFormatDate = userFormatDate
        self.title = title
        self.body = body
        self.favorite = favorite
        
    }

    init(with entity: NotesItem) {
        self.init(id: entity.id ?? UUID(),
                  date: entity.date ?? Date(),
                  title: entity.title ?? " ",
                  body: entity.body ?? " ",
                  favorite: entity.favorite)
    }
}
