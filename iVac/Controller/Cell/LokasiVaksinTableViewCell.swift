//
//  LokasiVaksinTableViewCell.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class LokasiVaksinTableViewCell: UITableViewCell {

    @IBOutlet weak var rsImage: UIImageView!
    @IBOutlet weak var rsName: UILabel!
    @IBOutlet weak var rsPhone: UILabel!
    @IBOutlet weak var rsAlamat: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
