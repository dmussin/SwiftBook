//
//  ViewController.swift
//  UITextField
//
//  Created by Daniyar Mussin on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        label.font = label.font.withSize(35)
        label.textColor = .white
        label.textAlignment = .center
        label.shadowColor = .systemOrange
        label.text = ""
        
    }

    @IBAction func doneButton(_ sender: UIButton) {
        
        // Проверка если поле заполнено или нет
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            // Alert
            let alert = UIAlertController(title: "Wrong Format ", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            print("Incorect format!")
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
}

