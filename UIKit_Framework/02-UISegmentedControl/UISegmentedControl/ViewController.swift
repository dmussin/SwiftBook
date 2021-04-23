//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Daniyar Mussin on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
    }


    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        
        label.isHidden = false
        
     
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The First Segment is selected"
            label.textColor = .systemRed
        case 1:
            label.text = "The Second Segment is selected"
            label.textColor = .systemIndigo
        case 2:
            label.text = "The Third Segment is selected"
            label.textColor = .systemTeal
        default:
            print("Something is wrong!")
        }
        
 
        
    }
}

