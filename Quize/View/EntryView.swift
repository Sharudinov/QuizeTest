//
//  CustomView.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

protocol ReceiverNextButtonTapDelegate: AnyObject {
    
    func nextButtonTapped(_ sender: UIButton)
    
}

class EntryView: UIView {
    var color: String!
    
    @IBOutlet var userNameTextField: UITextField!
    weak var delegate: ReceiverNextButtonTapDelegate?
    
    
    
    
    @IBAction func toMainViewButton(_ sender: UIButton) {
        
        delegate?.nextButtonTapped(sender)
    }
    
    
    
    
    var entryView: UIView!
    
    required init?(coder: NSCoder) {
        super.init (coder: coder)
        
        entryView = getViewFromXib()
        
        addSubview(entryView!)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        entryView?.frame = self.bounds
    }
    

}
