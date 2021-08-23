//
//  BothOfUsCell.swift
//  AssignmentBothOfUs
//
//  Created by Angelos Staboulis on 23/8/21.
//

import UIKit

class BothOfUsCell: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblID: UILabel!
    @IBOutlet var lblActive: UILabel!
    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var lblCreatedAt: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet var lblUpdatedAt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
