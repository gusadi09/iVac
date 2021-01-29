//
//  AkunViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class AkunViewController: UIViewController {

    @IBOutlet weak var profileScrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var jenisKelaminLabel: UILabel!
    @IBOutlet weak var nikLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var noTeleponLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tglLahirLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
      
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "Akun"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
        editButton.clipsToBounds = true
        editButton.layer.cornerRadius = 15
        editButton.layer.shadowColor = UIColor.systemBlue.cgColor
        editButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        editButton.layer.shadowOpacity = 0.25
        editButton.layer.shadowRadius = 12
        editButton.layer.masksToBounds = false
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 15
        loginButton.layer.shadowColor = UIColor.systemBlue.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        loginButton.layer.shadowOpacity = 0.25
        loginButton.layer.shadowRadius = 12
        loginButton.layer.masksToBounds = false
    }
    @IBAction func akunButtonPressed(_ sender: UIButton) {
        if sender == loginButton {
            performSegue(withIdentifier: "toLogin", sender: self)
        } else {
            performSegue(withIdentifier: "toEdit", sender: self)
        }
        
    }
}
