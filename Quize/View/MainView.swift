//
//  MainView.swift
//  Quize
//
//  Created by Мурад on 17.09.2021.
//

import UIKit

protocol ReceiverNextButtonDelegate:
    AnyObject{
    
    func nextButtonTap(_ sender:UIButton)
}

class MainView: UIView {
    
    weak var secondDelegate: ReceiverNextButtonDelegate?
    
    @IBOutlet var buttons: [UIButton]!
    @IBAction func toPaulseViewButton(_ sender: UIButton) {
        secondDelegate?.nextButtonTap(sender)
    }
    
    
    var mainView: UIView!
    
    required init?(coder: NSCoder) {
        super.init (coder: coder)
        
        mainView = getViewFromXib()
        
        addSubview(mainView!)
        
        buttons.forEach { (button) in
            button.setTitle(SaveQueezy.pollse[button.tag].name, for: [])
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainView?.frame = self.bounds
    }

}
