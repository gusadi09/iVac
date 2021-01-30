//
//  CheckoutViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var pilihLokasiVaksinButton: UIView!
    @IBOutlet weak var pilihMetodeButton: UIView!
    @IBOutlet weak var bayarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pilihMetodeButton.clipsToBounds = true
        pilihMetodeButton.layer.cornerRadius = 10
        pilihMetodeButton.layer.borderWidth = 1
        pilihMetodeButton.layer.borderColor = UIColor.systemGray5.cgColor
        
        pilihLokasiVaksinButton.clipsToBounds = true
        pilihLokasiVaksinButton.layer.cornerRadius = 10
        pilihLokasiVaksinButton.layer.borderWidth = 1
        pilihLokasiVaksinButton.layer.borderColor = UIColor.systemGray5.cgColor

        bayarButton.clipsToBounds = true
        bayarButton.layer.cornerRadius = 10
        bayarButton.layer.shadowColor = UIColor.systemBlue.cgColor
        bayarButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        bayarButton.layer.shadowOpacity = 0.25
        bayarButton.layer.shadowRadius = 12
        bayarButton.layer.masksToBounds = false
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
    }

    @IBAction func metodePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toMetode", sender: self)
    }
    
    @IBAction func rsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toRumahSakit", sender: self)
    }
    
    @IBAction func bayarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetailPesanan", sender: self)
    }
}
