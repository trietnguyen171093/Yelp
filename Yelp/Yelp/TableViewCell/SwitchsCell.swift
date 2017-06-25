//
//  SwitchsCell.swift
//  Yelp
//
//  Created by Triet on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol SwitchCellDelegate {
  func switchCell(switchCell: SwitchsCell, didChangeValue: Bool)
}
class SwitchsCell: UITableViewCell {

  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var switchButton: UISwitch!
  
  var delegate: SwitchCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  @IBAction func onSwitch(_ sender: UISwitch) {
    print("Changed to \(sender.isOn)")
    delegate.switchCell(switchCell: self, didChangeValue: sender.isOn)
  }
}
