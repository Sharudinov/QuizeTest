//
//  ScoresTableViewCell.swift
//  Quize
//
//  Created by Мурад on 25.11.2021.
//

import UIKit

class ScoresTableViewCell: UITableViewCell {

    @IBOutlet var levelScore: UILabel!
    @IBOutlet var pointsScore: UILabel!
    @IBOutlet var nameScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(level: String , points: Int , name: String) {
        levelScore.text = level
        pointsScore.text = "\(points)"
        nameScore.text = name
        }
    
    
}
