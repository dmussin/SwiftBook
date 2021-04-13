//
//  ViewController.swift
//  OutletsAndActions
//
//  Created by Daniyar Mussin on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet var labelCollection: [UILabel]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "Hello Label"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(#function)
    }
    
    
}

