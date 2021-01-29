//
//  VaksinViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class VaksinViewController: UIViewController {

    @IBOutlet weak var nikText: UITextField!
    @IBOutlet weak var cekButton: UIButton!
    
    var hasil: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
      
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "Cek Vaksin Pemerintah"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
        cekButton.clipsToBounds = true
        cekButton.layer.cornerRadius = 25
        cekButton.layer.shadowColor = UIColor.systemBlue.cgColor
        cekButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cekButton.layer.shadowOpacity = 0.25
        cekButton.layer.shadowRadius = 12
        cekButton.layer.masksToBounds = false
        
        nikText.tintColor = .systemBlue
    }

    @IBAction func cekPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toConfirm", sender: self)
        
        if nikText.text == "5105012708000002" {
            hasil = true
        } else {
            hasil = false
        }
        
        nikText.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dst = segue.destination as? BerhasilCekViewController else { return }
        
        if segue.identifier == "toConfirm" {
            DispatchQueue.main.async {
                dst.result = self.hasil
            }
        }
    }
}

