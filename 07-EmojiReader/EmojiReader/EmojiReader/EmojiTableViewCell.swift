//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by Daniyar Mussin on 10/04/2021.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(object: Emoji) { //входной параметр Emoji из EmojiModel 
        
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }

}
