//
//  ViewController.swift
//  16-UIGestureRecognizer
//
//  Created by Daniyar Mussin on 23.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        swipesObservers()
        tapObserver()
        
        
    }

    func swipesObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    // Наблюдатель за тапами
    func tapObserver() {
        let trippleTap = UITapGestureRecognizer(target: self, action: #selector(trippleTapAction))
        trippleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(trippleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: trippleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
   
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            label.text = "Right Swipe Was Recognized"
        case .left:
            label.text = "Left Swipe Was Recognized"
        case .up:
            label.text = "Up Swipe Was Recognized"
        case .down:
            label.text = "Down Swipe Was Recognized"
        default:
            break
        }
    }
    
    
    @objc func trippleTapAction(){
        label.text = "Tripple tap was recognized"
    }
    
    @objc func doubleTapAction(){
        label.text = "Double tap was recognized"
    }
    
    
    
}

