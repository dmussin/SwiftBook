//
//  ViewController.swift
//  07-UITextView
//
//  Created by Daniyar Mussin on 19.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
       // textView.text = ""
        
        textView.isHidden = true
        textView.alpha = 0
        
        
        textView.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        
        textView.layer.cornerRadius = 10
        
        // Устанавливаем шрифт на 17 и параметпы для stepper
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .systemOrange
        stepper.backgroundColor = .systemGray3
        stepper.layer.cornerRadius = 5
        
        // Activity Indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        activityIndicator.startAnimating()
        
        // Запрет взаимодестйвия пока активити активен
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        
        // Наблюдатель следящий за появлением и скрытыем клавиатуры
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Таймер на анимацию activityIndicator
        UIView.animate(withDuration: 0, delay: 3, options: .curveLinear, animations: {
            self.textView.alpha = 1
        }) { (finished) in
            self.activityIndicator.stopAnimating()
            self.textView.isHidden = false
            UIApplication.shared.endIgnoringInteractionEvents() // Отмена взаимодествия. 
        }
    }

    // Скрытие клавиатуры по тапу за пределами TextView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Скрывает клавиатуру, вызванная для любого объекта
        
        // textView.resignFirstResponder() // Скрывает клавиатуру для конкретного объекта
    }
    
    
    // метод updateTextView
    @objc func updateTextView(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        
        if notification.name == UIResponder.keyboardWillHideNotification{
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - bottomConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) { // срабатывает при тапе на text view.
        textView.backgroundColor = .darkGray
        textView.textColor = .green
    }
    
    func textViewDidEndEditing(_ textView: UITextView) { // Срабатывает когда тапаем вне text view
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .orange
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 100
    }
}

