//
//  ContentViewController.swift
//  15-UIPageViewController
//
//  Created by Daniyar Mussin on 22.04.2021.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var emojiLabel: UILabel!
    
    // Этот шаблон для презентации. Создаем свойства для pageViewController
    var presentText = ""
    var emoji = ""
    var currentPage = 0 // Номер текущей старницы
    var numberOfPages = 0 // Колличество страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Работаем с label
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        
    }
}
