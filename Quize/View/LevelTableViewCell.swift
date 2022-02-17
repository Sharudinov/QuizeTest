//
//  LevelTableViewCell.swift
//  Quize
//
//  Created by Мурад on 19.11.2021.
//

import UIKit

class LevelTableViewCell: UITableViewCell {
    @IBOutlet var variantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
