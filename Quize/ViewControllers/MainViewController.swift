//
//  MainViewController.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainView: MainView {
       return view as! MainView
    }
    private let toPaulseVCIdentifier = "toPaulseViewControllerSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.secondDelegate = self

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = (sender as? UIButton)?.tag else {
            return
        }
    }
  

}
extension MainViewController: ReceiverNextButtonDelegate {
    func nextButtonTap(_ sender: UIButton) {
        print(sender.tag)
        performSegue(withIdentifier: toPaulseVCIdentifier, sender: sender)
        
    }
    
    
}


