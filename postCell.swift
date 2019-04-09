//
//  postCell.swift
//  Parstagram
//
//  Created by Minjing Shi on 4/8/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//

import UIKit

class postCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
