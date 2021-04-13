//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Daniyar Mussin on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDayButton(_ sender: UIButton) {
        
//        if let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text {} - Проверка что бы значения были в textField.
     
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        //dateComponents.year = Int(yearTextField.text!)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "cs")
        dateFormatter.dateFormat = "EEEE"
     
//        date была опциональной
//        let date = calendar.date(from: dateComponents)
//
//        let weekDay = dateFormatter.string(from: date!)

        guard let date = calendar.date(from: dateComponents) else { return }
        guard let weekDay = dateFormatter.string(for: date) else { return }
        
        let capWeekDay = weekDay.capitalized
        
        resultLabel.text = capWeekDay
        
    }
    
    // keyboard 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

