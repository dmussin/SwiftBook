//
//  ViewController.swift
//  06-UIDatePicker
//
//  Created by Daniyar Mussin on 14.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.font = label.font.withSize(35)
        label.textColor = .white
        label.textAlignment = .center
        label.shadowColor = .systemOrange
        label.text = ""
    }


    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "csGTMH")
        
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
    }
}

