//
//  ViewController.swift
//  UIScrollView
//
//  Created by Daniyar Mussin on 14.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Scroll"
        label.textColor = .systemOrange
        label.font = label.font.withSize(30)
        
    }


}

