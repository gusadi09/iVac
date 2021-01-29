//
//  BerhasilViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class BerhasilCekViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var hasilLabel: UILabel!
    @IBOutlet weak var kembaliButton: UIButton!
    @IBOutlet weak var hasilImage: UIImageView!
    
    var result: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if result == false {
            hasilImage.image = UIImage(named: "Group 2")
            hasilLabel.text = "Mohon maaf anda belum terdaftar sebagai penerima vaksin pemerintah."
            detailButton.isHidden = true
            kembaliButton.isHidden = false
        } else {
            hasilImage.image = UIImage(named: "checked")
            hasilLabel.text = "Selamat anda terdaftar sebagai penerima vaksin pemerintah. Berikut informasi lebih jelasnya."
            detailButton.isHidden = false
            kembaliButton.isHidden = true
        }
        
        kembaliButton.clipsToBounds = true
        kembaliButton.layer.cornerRadius = 25
        kembaliButton.layer.shadowColor = UIColor.systemBlue.cgColor
        kembaliButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        kembaliButton.layer.shadowOpacity = 0.25
        kembaliButton.layer.shadowRadius = 12
        kembaliButton.layer.masksToBounds = false
        
        detailButton.clipsToBounds = true
        detailButton.layer.cornerRadius = 25
        detailButton.layer.shadowColor = UIColor.systemBlue.cgColor
        detailButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        detailButton.layer.shadowOpacity = 0.25
        detailButton.layer.shadowRadius = 12
        detailButton.layer.masksToBounds = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func confirmPressed(_ sender: UIButton) {
        if sender == kembaliButton {
            navigationController?.popToRootViewController(animated: true)
        } else {
            performSegue(withIdentifier: "toHasil", sender: self)
        }
    }
}
