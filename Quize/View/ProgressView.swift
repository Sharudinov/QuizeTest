//
//  ProgressView.swift
//  Quize
//
//  Created by Мурад on 17.09.2021.
//

import UIKit

class ProgressView: UIView {

    private enum Constants {
        enum Values {
            static let timerDelay: TimeInterval = 0.1
            static let timerStepsCount = 300
        }
    }
    
    
    // mark - properties
    
    @IBOutlet var progressView: UIView!
    
    @IBOutlet var progressWidthConstraint: NSLayoutConstraint!
    @IBOutlet var timeLeaveLabel: UILabel!
    @IBOutlet var backingView: UIView!
    private let progressInset: CGFloat = 3
    private var wrappedView: UIView!
    
    
    
    
    
    // MARK: - view methods
    required init? (coder: NSCoder) {
        super.init(coder: coder)
        
        wrappedView = getViewFromXib()
        addSubview(wrappedView)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wrappedView.frame = bounds
        
        backingView.layer.cornerRadius = backingView.frame.height / 2
        progressView.layer.cornerRadius = backingView.frame.height / 2 - progressInset
    }
    
    private func setupUI() {
        backingView.layer.borderWidth = 1
        backingView.layer.borderColor = UIColor.red.cgColor
    }
    
    func updateProgress(_ progress: Double){
        let newProgress = max(0, min(1, progress))
        let progressWidth = (backingView.bounds.width - progressInset * 3 - progressView.bounds.height) * CGFloat(newProgress)
        progressWidthConstraint.constant = progressWidth
        UIView.animate(withDuration: Constants.Values.timerDelay) {
            self.layoutIfNeeded()
            
        }
        let time = Int(Double(Constants.Values.timerStepsCount) * Constants.Values.timerDelay * newProgress)
        timeLeaveLabel.text = "\(time) sec"
        }
}


