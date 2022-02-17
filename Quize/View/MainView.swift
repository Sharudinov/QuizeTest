//
//  MainView.swift
//  Quize
//
//  Created by Мурад on 17.09.2021.
//

import UIKit

protocol ReceiverNextButtonDelegate:AnyObject{
    
    func nextButtonTap(_ sender:UIButton)
}

class MainView: UIView {
    
    let levelPaulse: [String] = ["Английский уровень 1",
    "Английский уровень 2",
    "Английский уровень 3"]
    
    weak var secondDelegate: ReceiverNextButtonDelegate?
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var helloLabel: UILabel!
   
    
    
    var mainView: UIView!
    
    required init?(coder: NSCoder) {
        super.init (coder: coder)
        
        mainView = getViewFromXib()
        
        addSubview(mainView!)
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainView?.frame = self.bounds
    }

}

