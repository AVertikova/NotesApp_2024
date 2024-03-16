//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Анна Вертикова on 12.03.2024.
//

import UIKit

class NoteDetailsViewController: UIViewController, NoteDetailsViewPropertiesProtocol {
    var presenter: NoteDetailsViewToPresenterRequestProtocol?
    private var currenNote: NoteModelProtocol?

    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var noteBodyField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }

    func getData() {
        presenter?.fetchNoteDetails()
    }
    
    @IBAction func saveNoteButtonTapped(_ sender: Any) {

        let noteToSave = NoteDisplayModel(id: UUID(), 
                                          date: Date(),
                                          title: noteTitleField.text ?? "",
                                          body: noteBodyField.text ?? "",
                                          favorite: currenNote?.favorite ?? false)
        let request = Note.NoteAddedOrUpdated.Request(currentNote: noteToSave)
        presenter?.saveNoteButtonTapped(request: request)
        navigationController?.popViewController(animated: true)
    }
}

extension NoteDetailsViewController: NoteDetailsPresenterToViewResponseProtocol {
    
    func displayNoteDetails(viewModel: Note.GetNoteDetailsData.ViewModel) {
        self.currenNote = viewModel.note
        noteTitleField.text = viewModel.note?.title
        noteBodyField.text = viewModel.note?.body
        title = viewModel.note?.userFormatDate

    }
}
