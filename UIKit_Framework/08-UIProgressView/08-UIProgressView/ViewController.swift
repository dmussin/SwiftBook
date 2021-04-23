//
//  ViewController.swift
//  08-UIProgressView
//
//  Created by Daniyar Mussin on 19.04.2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.isHidden = true
        
        textView.layer.cornerRadius = 10
    
        progressView.setProgress(1, animated: true)
        
        // Activity Indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        activityIndicator.startAnimating()
        
        
     
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                self.progressView.isHidden = true
            }
        }
        
        
    }
    
    
}

