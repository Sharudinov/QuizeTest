//
//  PaulseView.swift
//  Quize
//
//  Created by Мурад on 17.09.2021.
//

import UIKit


class PaulseView: UIView {
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var progressView: ProgressView!
    
    
    
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
    
   
}
