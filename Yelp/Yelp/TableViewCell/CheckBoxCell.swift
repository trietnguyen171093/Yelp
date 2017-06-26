//
//  CheckBoxCell.swift
//  Yelp
//
//  Created by Triet on 6/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class CheckBoxCell: UITableViewCell {
  
  @IBOutlet weak var checkBoxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
