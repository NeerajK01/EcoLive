//
//  ShowMoreCell.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import UIKit

class ShowMoreCell: UITableViewCell {

    @IBOutlet weak var showMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.showMoreButton.layer.masksToBounds = true
        self.showMoreButton.layer.cornerRadius = self.showMoreButton.frame.height * 0.2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
