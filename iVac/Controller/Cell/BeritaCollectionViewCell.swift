//
//  BeritaCollectionViewCell.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class BeritaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBerita: UIImageView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBerita.clipsToBounds = true
        imageBerita.layer.cornerRadius = 5
        
        blackView.clipsToBounds = true
        blackView.layer.cornerRadius = 5
    }

}
