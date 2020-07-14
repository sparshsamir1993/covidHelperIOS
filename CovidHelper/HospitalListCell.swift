//
//  HospitalListCell.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class HospitalListCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        contactLabel.adjustsFontForContentSizeCategory = true

    }
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        nameLabel.font = bodyFont
        contactLabel.font = bodyFont
    }

}
