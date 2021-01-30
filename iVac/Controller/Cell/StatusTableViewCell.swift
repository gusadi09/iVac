//
//  StatusTableViewCell.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var invoiceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
