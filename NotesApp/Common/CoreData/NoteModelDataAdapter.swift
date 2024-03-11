//
//  NoteModelDataAdapter.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation

class NoteModelDataAdapter {
    func mapData(_ entities: [NotesItem]) -> [NoteModelProtocol] {
        var models: [NoteModelProtocol] = []
        for element in entities {
            let model: NoteModelProtocol = NoteDisplayModel(with: element)
            models.append(model)
        }
        models.reverse()
        return models
    }
}
