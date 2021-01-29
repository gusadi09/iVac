//
//  ViewController.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var masukButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masukButton.clipsToBounds = true
        masukButton.layer.cornerRadius = 25
        masukButton.layer.shadowColor = UIColor.systemBlue.cgColor
        masukButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        masukButton.layer.shadowOpacity = 0.25
        masukButton.layer.shadowRadius = 12
        masukButton.layer.masksToBounds = false
    }


}

