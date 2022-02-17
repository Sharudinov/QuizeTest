//
//  ScoresView.swift
//  Quize
//
//  Created by Мурад on 25.11.2021.
//

import UIKit

class ScoresView: UIView {

    @IBOutlet var scoresTableView: UITableView!
    var scoresView: UIView!
    
    required init?(coder: NSCoder) {
        super.init (coder: coder)
        
        scoresView = getViewFromXib()
        
        addSubview(scoresView!)
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scoresView?.frame = self.bounds
    }

}
