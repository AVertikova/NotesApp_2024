//
//  UIContextualAction+ActionViewConfiguration.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

enum ActionImage: String {
    case remove = "trash"
    case favoriteIsFalse = "star"
    case favoriteIsTrue = "star.fill"
}

extension UIContextualAction {
    func configureActionView(with imageName: ActionImage) {
        self.image = UIImage(systemName: imageName.rawValue)
        switch imageName {
        case .remove:
            self.backgroundColor = .systemRed
        case .favoriteIsFalse:
            self.backgroundColor = .systemYellow
        case .favoriteIsTrue:
            self.backgroundColor = .systemYellow
        }
        
    }
}
