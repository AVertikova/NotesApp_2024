//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

class NoteDetailsViewController: UIViewController, NoteDetailsViewPropertiesProtocol {
    var presenter: NoteDetailsViewToPresenterRequestProtocol?
    private var currentNote: NoteModelProtocol?
    private var isFavorite = false

    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var noteBodyField: UITextView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }

    func getData() {
        presenter?.fetchNoteDetails()
    }
    
    
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        isFavorite.toggle()
        favoriteButton.image =  isFavorite ? UIImage(systemName: ActionImage.favoriteIsTrue.rawValue) : UIImage(systemName: ActionImage.favoriteIsFalse.rawValue)
    }
    
    @IBAction func saveNoteButtonTapped(_ sender: Any) {

        let noteToSave = NoteDisplayModel(id: UUID(), 
                                          date: Date(),
                                          title: noteTitleField.text ?? "",
                                          body: noteBodyField.text ?? "",
                                          favorite: isFavorite)
        let request = Note.NoteAddedOrUpdated.Request(currentNote: noteToSave)
        presenter?.saveNoteButtonTapped(request: request)
        navigationController?.popViewController(animated: true)
    }
}

extension NoteDetailsViewController: NoteDetailsPresenterToViewResponseProtocol {
    
    func displayNoteDetails(viewModel: Note.GetNoteDetailsData.ViewModel) {
        if let note = viewModel.note {
            self.currentNote = note
            self.isFavorite = note.favorite
            noteTitleField.text = note.title
            noteBodyField.text =  note.body
            favoriteButton.image =  note.favorite ? UIImage(systemName: ActionImage.favoriteIsTrue.rawValue) : UIImage(systemName: ActionImage.favoriteIsFalse.rawValue)
            //        title = viewModel.note?.userFormatDate
        }
    }
}
