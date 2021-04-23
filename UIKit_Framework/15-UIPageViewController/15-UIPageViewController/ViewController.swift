//
//  ViewController.swift
//  15-UIPageViewController
//
//  Created by Daniyar Mussin on 22.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // для вызова метода переопределяем метод viewDidAppear через суперкласс
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }

    // метод позволяющий отобразить viewController
    func startPresentation() {
        
        let userDefalts = UserDefaults.standard
        let presentationWasViewed = userDefalts.bool(forKey: "presentationWasViewed")
        
        if presentationWasViewed == false {
        
        if let pageViewController = storyboard?.instantiateViewController(
            withIdentifier: "PageViewController") as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
         }
       }
    }

 
}

