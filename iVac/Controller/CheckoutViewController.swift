//
//  CheckoutViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class CheckoutViewController: UIViewController, LokasiVaksinDelegate, MetodeDelegate {
 

    @IBOutlet weak var pilihLokasiVaksinButton: UIView!
    @IBOutlet weak var pilihMetodeButton: UIView!
    @IBOutlet weak var bayarButton: UIButton!
    @IBOutlet weak var lokasiLabel: UILabel!
    @IBOutlet weak var metodeLabel: UILabel!

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func passDataBack(namaRs: String) {
       
        lokasiLabel.text = namaRs
    }
    
    func passDataMetodeBack(namaMetode: String) {
        metodeLabel.text = namaMetode
    }
    
    @IBAction func metodePressed(_ sender: UIButton) {
        let metvc = storyboard?.instantiateViewController(withIdentifier: "MetodeViewController") as? MetodeViewController
        
        metvc?.delegate = self
        present(metvc!, animated: true, completion: nil)
    }
    
    @IBAction func rsPressed(_ sender: UIButton) {
      
        let vc = storyboard?.instantiateViewController(withIdentifier: "LokasiVaksinViewController") as? LokasiVaksinViewController
        
        vc?.delegate = self
        present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func bayarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetailPesanan", sender: self)
    }
}
