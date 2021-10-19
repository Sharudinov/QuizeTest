//
//  PaulseViewController.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

class PaulseViewController: UIViewController {
    var paulseView: PaulseView {
        view as! PaulseView
    }
    var value: Double = 0 {
        didSet {
            self.paulseView.progressView.updateProgress(self.value)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        value = 0
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addValue()
    }
    private func addValue() {
            value += 0.01

            if value > 1 { return }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                self.addValue()
            }
        }
}
