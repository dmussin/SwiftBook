//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Daniyar Mussin on 10/04/2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // создаем массив данных то структуры emojiModel
    var objects = [
        Emoji(emoji: "🧐", name: "Learn", description: "Keep learning, bitch", isFavorite: false),
        Emoji(emoji: "🛩", name: "Travel", description: "Keep travel, bitch", isFavorite: false),
        Emoji(emoji: "💰", name: "Earn", description: "Keep earn, bitch", isFavorite: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Navigation button and Title
        self.title = "Emoji Reader 🙃"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    // Возвращенеи на первый экран со второго Segue Unwind
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! NewEmojiTableViewController
        let emoji = sourceVC.emoji
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            objects[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
        let newIndexPath = IndexPath(row: objects.count, section: 0)
        objects.append(emoji)
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editEmoji" else {return }
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = objects[indexPath.row]
        let navigationVC = segue.destination as! UINavigationController
        let newEmojiVC = navigationVC.topViewController as! NewEmojiTableViewController
        newEmojiVC.emoji = emoji
        newEmojiVC.title = "Edit"
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count // Обращаемся к массиву и устанавливаем его колличество
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell // меняем с cell на кастомную emojiCell и указываем как emojiViewTableCell
       
        // вывод ячейки через indexPath.
        let object = objects[indexPath.row]
        cell.set(object: object) // ячейка настраивается через функцию set в EmojiTableViewCell

        return cell
    }
    
    // Добавление метода удаления строки
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // перенос строк
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row) // зафиксированная строка
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // Свайп влево с 2 действиями
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)  // добавляем функцию done
        let favorite = favoriteAction(at: indexPath) // добавляем функцию favorite
        return UISwipeActionsConfiguration(actions: [done, favorite])
    }
    
    
    // Delete Action After Swipe.
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
        
    }
    
    // Favorite Action
    func favoriteAction(at indexPath: IndexPath) -> UIContextualAction{
        var object = objects[indexPath.row] // обращение к массиву(объекту)
        let action = UIContextualAction(style: .destructive, title: "Like") { (action, view, completion) in
            object.isFavorite = !object.isFavorite //меняем на обратный был false стал true.
            self.objects[indexPath.row] = object
            completion(true)
    }
     
        action.backgroundColor = object.isFavorite ? .systemPurple : .systemGray
        action.image = UIImage(systemName: "heart")
        return action
        
}
}
