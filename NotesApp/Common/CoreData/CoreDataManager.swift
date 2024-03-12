//
//  CoreDataManager.swift
//  NotesApp
//
//  Created by Анна Вертикова on 11.03.2024.
//

import Foundation
import CoreData

enum Filter: String {
    case byId = "id == %@"
}

enum Key: String {
    case id
    case date
    case title
    case body
    case favorite
}

enum DefaultMessage: String {
    case title = "Hi there, guys!"
    case body = "Have a nice day!"
}

class CoreDataManager: StorageManagerProtocol {
    
    static let sharedManager = CoreDataManager()
    private let dataAdapter = NoteModelDataAdapter()
    private let entityName = "NotesItem"
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NotesApp")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    private lazy var defaultNote: NoteDisplayModel = {
        var note: NoteDisplayModel = NoteDisplayModel(id: UUID(),
                                                      date: Date(),
                                                      title: DefaultMessage.title.rawValue,
                                                      body: DefaultMessage.body.rawValue)
        self.saveNote(noteToSave: note)
        return note
    }()
    
    private init() {}
    
    
    func fetchNotesList() -> [NoteModelProtocol] {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesItem>(entityName: entityName)
        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                return [defaultNote]
            }
            return dataAdapter.mapData(results)
        } catch _ {
            return [NoteModelProtocol]()
        }
    }
    
    func updateNotesList() -> [NoteModelProtocol] {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesItem>(entityName: entityName)
        do {
            let results = try context.fetch(fetchRequest)
            return dataAdapter.mapData(results)
        } catch _ {
            return [NoteDisplayModel()]
        }
    }
    
    func saveContext() {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveNote(noteToSave: NoteModelProtocol) {
        defer {self.saveContext()}
        
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as? NotesItem {
            entity.setValue(noteToSave.id, forKey: Key.id.rawValue)
            entity.setValue(noteToSave.date, forKey: Key.date.rawValue)
            entity.setValue(noteToSave.title, forKey: Key.title.rawValue)
            entity.setValue(noteToSave.body, forKey: Key.body.rawValue)
            entity.setValue(noteToSave.favorite, forKey: Key.favorite.rawValue)
        }
    }
    
    func updateNote(oldValue: NoteModelProtocol, newValue: NoteModelProtocol) {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesItem>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: Filter.byId.rawValue, oldValue.id as CVarArg)
        
        do {
            let items = try context.fetch(fetchRequest)
            for item in items {
                item.title = newValue.title
                item.body = newValue.body
                item.date = newValue.date
                item.favorite = newValue.favorite
                let model: NoteDisplayModel = NoteDisplayModel(with: item)
                context.delete(item)
                self.saveNote(noteToSave: model)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func removeNote(noteToRemove: NoteModelProtocol) {
        defer {self.saveContext()}
        
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesItem>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: Filter.byId.rawValue, noteToRemove.id as CVarArg)
        do {
            let items = try context.fetch(fetchRequest)
            for item in items {
                context.delete(item)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
