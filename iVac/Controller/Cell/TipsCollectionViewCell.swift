//
//  TipsCollectionViewCell.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTips: UIImageView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var titleTips: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageTips.clipsToBounds = true
        imageTips.layer.cornerRadius = 5
        
        blackView.clipsToBounds = true
        blackView.layer.cornerRadius = 5
    }

}
