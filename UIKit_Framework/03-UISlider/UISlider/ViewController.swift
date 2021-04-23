//
//  ViewController.swift
//  UISlider
//
//  Created by Daniyar Mussin on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
       
        label.font = label.font.withSize(30)
        label.textColor = .systemOrange
        label.textAlignment = .center
        label.text = String(slider.value)
    
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        slider.minimumTrackTintColor = .systemGreen
        slider.maximumTrackTintColor = .systemRed
        slider.thumbTintColor = .systemIndigo
        
    }


    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.text = String(sender.value)
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
        
    }
}

