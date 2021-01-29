//
//  JenisTableViewCell.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class JenisTableViewCell: UITableViewCell {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var isiLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jenisImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        jenisImage.clipsToBounds = true
        jenisImage.layer.cornerRadius = 5
        jenisImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        //allView
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 5
        
        allView.layer.shadowColor = UIColor.black.cgColor
        allView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        allView.layer.shadowOpacity = 0.1
        allView.layer.shadowRadius = 12
        allView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
