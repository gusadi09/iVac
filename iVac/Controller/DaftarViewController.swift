//
//  DaftarViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class DaftarViewController: UIViewController {

    @IBOutlet weak var daftarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        daftarButton.clipsToBounds = true
        daftarButton.layer.cornerRadius = 25
        daftarButton.layer.shadowColor = UIColor.systemBlue.cgColor
        daftarButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        daftarButton.layer.shadowOpacity = 0.25
        daftarButton.layer.shadowRadius = 12
        daftarButton.layer.masksToBounds = false
    }
}
