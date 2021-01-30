//
//  DetailPesanViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class DetailPesanViewController: UIViewController {

    @IBOutlet weak var kembaliButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
        
        kembaliButton.clipsToBounds = true
        kembaliButton.layer.cornerRadius = 25
        kembaliButton.layer.shadowColor = UIColor.systemBlue.cgColor
        kembaliButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        kembaliButton.layer.shadowOpacity = 0.25
        kembaliButton.layer.shadowRadius = 12
        kembaliButton.layer.masksToBounds = false
    }
    
    @IBAction func kembaliPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
