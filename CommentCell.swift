//
//  CommentCell.swift
//  Parstagram
//
//  Created by Minjing Shi on 4/15/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CommentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
