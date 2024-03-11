//
//  NotesItem+CoreDataProperties.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//
//

import Foundation
import CoreData


extension NotesItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesItem> {
        return NSFetchRequest<NotesItem>(entityName: "NotesItem")
    }

    @NSManaged public var body: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension NotesItem : Identifiable {

}
