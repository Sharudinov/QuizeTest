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
        mainView.helloLabel.text = "Hello " + Singleton.shared.userName
        super.viewDidLoad()
        mainView.secondDelegate = self
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == toPaulseVCIdentifier else {return}
        guard let index = (sender as? UIButton)?.tag else {
            return
        }
        guard let paulseVC = segue.destination as? PaulseViewController else {return}
        
        paulseVC.currentPolse = SaveQueezy.pollse[index]
    }
  

}
extension MainViewController: ReceiverNextButtonDelegate {
    func nextButtonTap(_ sender: UIButton) {
        print(sender.tag)
        performSegue(withIdentifier: toPaulseVCIdentifier, sender: sender)
        
    }
    
    
}


