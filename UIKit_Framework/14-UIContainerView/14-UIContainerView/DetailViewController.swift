//
//  DetailViewController.swift
//  14-UIContainerView
//
//  Created by Daniyar Mussin on 22.04.2021.
//

import UIKit

class DetailViewController: UITableViewController {

    
    let imageNameArray = [
    "Track Number 1 - 01 FF8 - Blamb Garden",
    "Track Number 2 - 02 FF8 - Blue Fields",
    "Track Number 3 - 03 FF8 - Find your way",
    "Track Number 4 - 04 FF8 - Julia",
    "Track Number 5 - 05 FF8 - Trust me",
    "Track Number 6 - 06 FF8 - Under her control",
    "Track Number 7 - 07 FF8 - Martial Law"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)

        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row]) // Установка изображения для конкретной строки
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    // Высота ячейки = 60
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Позволяет фиксировать ту строку которую мы выделяем
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // передаем данных из строки в родительский viewController
        // Создаем константу и обращаемся в род viewController
        if let viewController = parent as? ViewController {
            let titleTrack = imageNameArray[indexPath.row]
            viewController.titleLabel.text = titleTrack
            
            viewController.imageCoverr.image = UIImage(named: titleTrack)
        }
    }
}
