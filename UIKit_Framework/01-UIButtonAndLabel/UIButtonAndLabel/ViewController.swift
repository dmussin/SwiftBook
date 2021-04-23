//
//  ViewController.swift
//  UIButtonAndLabel
//
//  Created by Daniyar Mussin on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet var actionButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Скрывает объект
        label2.isHidden = true
        
        label2.font = label2.font.withSize(20)
        label2.textColor = UIColor.systemYellow
    
        
        button.isHidden = true
     
     // используем цикл для того чтобы изменить цвета кнопок action1 и 2
        for button in actionButtons {
            button.setTitleColor(.systemIndigo, for: .normal)
            button.backgroundColor = .brown
        }
        
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.backgroundColor = .darkGray
        
    }
    
    @IBAction func changeLabelButton(_ sender: UIButton) {
        
//        if label2.isHidden {
//            label2.isHidden = false
//            label2.text = "UILabel Text Has Changed"
//
//            button.setTitle("Clear", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.backgroundColor = .black
//            button.layer.cornerRadius = 15
//        } else {
//            label2.isHidden = true
//
//            button.setTitle("Change Lable", for: .normal)
//            button.setTitleColor(.green, for: .normal)
//            button.backgroundColor = .systemGray3
//            button.layer.cornerRadius = 10
//        }
        
        
        
        
        label2.isHidden = false
        button.isHidden = false
        
        // sender это параметр для кнопки при нажатии
        if sender.tag == 1 {
            label2.text = "UILabel Text"
            label2.textColor = .red
        } else if sender.tag == 2 {
            label2.text = "UILabel Text Has Changed"
            label2.textColor = .green
        } else if sender.tag == 3 {
            label2.isHidden = true
            button.isHidden = true
        }

    }
}

