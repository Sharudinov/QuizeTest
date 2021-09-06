//
//  ViewController.swift
//  Quize
//
//  Created by Мурад on 29.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    
    
        
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        helloLabel.text = "Hi"
    }
    
}

