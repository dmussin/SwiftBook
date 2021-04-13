//
//  ViewController.swift
//  PassDataProject
//
//  Created by Daniyar Mussin on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
        
        // переход на другой экран с помощью if else
//        if someValue == true  {
//        performSegue(withIdentifier: "detailSegue", sender: nil)
//        } else {
//            performSegue(withIdentifier: "secondSegue", sender: nil)
//        }
    }
    
    
    // Возвращение на начальный экран через кнопку
//    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
//        guard let svc = segue.source as? SecondViewController else { return }
//        self.resultLabel.text = svc.label.text
//    }
    
    
  
    //Второй способ через индетификатор
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let svc = segue.source as? SecondViewController else { return }
        self.resultLabel.text = svc.label.text
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = loginTextField.text
    }
    
    
}

