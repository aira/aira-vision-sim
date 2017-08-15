//
//  TableViewCell.swift
//  OpenSource
//
//  Created by Haasith Sanka on 8/15/17.
//  Copyright © 2017 Haasith Sanka. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    var Disease:Disease!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
