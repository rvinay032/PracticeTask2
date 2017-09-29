//
//  SubTableViewCell.swift
//  PracticeTask2
//
//  Created by appinventiv on 29/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var continentsDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
