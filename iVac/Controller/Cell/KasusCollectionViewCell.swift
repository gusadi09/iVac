//
//  KasusCollectionViewCell.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class KasusCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    var color: UIColor = .systemBlue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        //Title View
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 5
        titleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        titleView.backgroundColor = color
        
        //allView
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 5
        allView.backgroundColor = color
    }
}
