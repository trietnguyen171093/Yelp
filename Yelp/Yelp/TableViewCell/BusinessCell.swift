//
//  BusinessCell.swift
//  Yelp
//
//  Created by Triet on 6/24/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

  @IBOutlet weak var businessImage: UIImageView!
  
  @IBOutlet weak var businessLabel: UILabel!
  
  @IBOutlet weak var distanceLabel: UILabel!
  
  @IBOutlet weak var reviewCountLabel: UILabel!
  
  @IBOutlet weak var categoryLabel: UILabel!
  
  @IBOutlet weak var reviewImage: UIImageView!
  
  @IBOutlet weak var addressLabel: UILabel!
  var business: Business!{
    didSet{
      businessImage.setImageWith(business.imageURL!)
      businessLabel.text = business.name
      distanceLabel.text = business.distance
//      reviewCountLabel.text = business.reviewCount as! String
      categoryLabel.text = business.categories
      reviewImage.setImageWith(business.ratingImageURL!)
      addressLabel.text = business.address
    }
  
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
