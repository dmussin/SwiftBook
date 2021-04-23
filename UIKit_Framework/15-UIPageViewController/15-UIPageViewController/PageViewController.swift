//
//  PageViewController.swift
//  15-UIPageViewController
//
//  Created by Daniyar Mussin on 22.04.2021.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентации - о приложении",
        "Вторая страница презентации - о фишках",
        "Третья страница презентации - об интересном",
        "Четвертая страница презентации - завершение",
        ""
    ]
    
    let eemojiArray = ["📲","🆔","🪙","👁‍🗨",""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Тк подписались под протокол UIPageViewControllerDataSource, необходимо назначит класс делегатом этого протокола
        dataSource = self

        // отображаем viewController
        if let contentvViewController = showViwControllerAtIndex(0) { // при загрузке устанавливается первая страница
            setViewControllers([contentvViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
// Метод создающий view внутри PageViewController
    func showViwControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            dismiss(animated: true, completion: nil)
            return nil }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = eemojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }
   

}


extension PageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Принимает значение текущей страницы ContentViewController -> Приводим viewController к ContentViewController
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViwControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViwControllerAtIndex(pageNumber)
    }
    
    
}
