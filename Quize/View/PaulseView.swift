//
//  PaulseView.swift
//  Quize
//
//  Created by Мурад on 17.09.2021.
//

import UIKit

protocol PaulseViewAnswerSelectionDelegate: AnyObject {
    func buttonDidTap(_ string: String)
}

class PaulseView: UIView {
    
    weak var delegate: PaulseViewAnswerSelectionDelegate?
    
    @IBOutlet var progressView: ProgressView!
    
    @IBOutlet var titlleLabel: UILabel!
    @IBOutlet var answerButton: [UIButton]!
    var paulseView: UIView!
    
    required init?(coder: NSCoder) {
        super.init (coder: coder)
        
        paulseView = getViewFromXib()
        
        addSubview(paulseView!)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        paulseView?.frame = self.bounds
    }
    
    @IBAction func answerDidTap(_ sender: UIButton) {
        delegate?.buttonDidTap(sender.titleLabel?.text ?? "")
    }
}
