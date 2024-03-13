//
//  UIContextualAction+ActionViewConfiguration.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

extension UIContextualAction {
    func configureActionView(with imageName: ActionImage) {
        switch imageName {
        case .remove:
            self.image = UIImage(systemName: ActionImage.remove.rawValue)
            self.backgroundColor = .systemRed
        case .addToFavorites:
            self.image = UIImage(systemName: ActionImage.addToFavorites.rawValue)
            self.backgroundColor = .systemYellow
        case .removeFromFavorites:
            self.image = UIImage(systemName: ActionImage.removeFromFavorites.rawValue)
            self.backgroundColor = .systemYellow
        }
        
    }
}
