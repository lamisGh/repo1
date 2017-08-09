//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    
    var note : Note?
    
    
    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteContentTextField: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "save" {
            if let note = note {
                // 1
                note.title = noteContentTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                // 2
                listNotesTableViewController.tableView.reloadData()
            } else {
                // 3
                let newNote = CoreDataHelper.newNote()
                newNote.title = noteContentTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                newNote.modificationTime = Date() as NSDate
                listNotesTableViewController.notes.append(newNote)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1
        if let note = note {
            // 2
            noteContentTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            // 3
            noteContentTextField.text = ""
            noteContentTextView.text = ""
        }
    }}
