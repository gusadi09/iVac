//
//  DetailCekViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class DetailCekViewController: UIViewController {

    @IBOutlet weak var kembaliButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        kembaliButton.clipsToBounds = true
        kembaliButton.layer.cornerRadius = 25
        kembaliButton.layer.shadowColor = UIColor.systemBlue.cgColor
        kembaliButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        kembaliButton.layer.shadowOpacity = 0.25
        kembaliButton.layer.shadowRadius = 12
        kembaliButton.layer.masksToBounds = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func kembaliPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
