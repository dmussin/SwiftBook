//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Daniyar Mussin on 08/04/2021.
//

import UIKit

class SecondViewController: UIViewController {

    var login: String? 
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        label.text = "Hello, \(login)"
    }
    
    
    @IBAction func goBackButton(_ sender: UIButton) {
        // возврат через индетификатор второй способ
        performSegue(withIdentifier: "unwindSegue", sender: nil)
        
    }
    
}
