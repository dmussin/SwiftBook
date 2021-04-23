//
//  ViewController.swift
//  13-WebKit
//
//  Created by Daniyar Mussin on 22.04.2021.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var urlTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextView.delegate = self
        webView.navigationDelegate = self
        
        
        let homePage = "https://www.apple.com"
        let url = URL(string:homePage)
        let request = URLRequest(url: url!)
        
        // textView = homepage
        urlTextView.text = homePage
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
       
    }

    @IBAction func backButtonAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
}

// Использование расширения протокола для того что бы textView мог открывать другие страницы
// WKNavigationDelegate = позволяет отображать в textView актуальную ссылку
extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        // скрытие клавиатуры
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // строку адреса в текстовое поле
        urlTextView.text = webView.url?.absoluteString
        
        // кнопки активны если canGoBack возможно
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
    
    
}

