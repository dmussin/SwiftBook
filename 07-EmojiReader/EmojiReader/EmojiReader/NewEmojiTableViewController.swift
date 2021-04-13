//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Daniyar Mussin on 10/04/2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    // создание дефолтных значений и изменение значений после нажатия кнопки save и передача в таблицу
    var emoji = Emoji(emoji: "", name: "", description: "", isFavorite: false)
    
    
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        updateSaveButtonState()
    }
    
    // Функция кнопки save для того что бы была активной при заполнении всех text fileds
    private func updateSaveButtonState(){
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
        
    }
    
    private func updateUI(){
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavorite: self.emoji.isFavorite)
    }
    
}
