//
//  ViewController.swift
//  TConverter
//
//  Created by Daniyar Mussin on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
            slider.thumbTintColor = UIColor.systemGreen
            slider.maximumTrackTintColor = UIColor.yellow
            slider.minimumTrackTintColor = UIColor.red
        }
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let tempretatureCelsious = Int(round(sender.value))
        celciusLabel.text = "\(tempretatureCelsious)ºC"
        
        let fahrenheitTempretaure = Int(round((sender.value * 9 / 5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTempretaure)ºF"
        
        
    }
    
    


}

