//
//  PesanViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class PesanViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 10
        
        checkoutButton.clipsToBounds = true
        checkoutButton.layer.cornerRadius = 25
        checkoutButton.layer.shadowColor = UIColor.systemBlue.cgColor
        checkoutButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        checkoutButton.layer.shadowOpacity = 0.25
        checkoutButton.layer.shadowRadius = 12
        checkoutButton.layer.masksToBounds = false
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
    }
    
    @IBAction func countStepperPress(_ sender: UIStepper) {
        DispatchQueue.main.async {
            self.countLabel.text = "\(Int(self.countStepper.value))"
        }
    }
    @IBAction func checkoutPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCheckout", sender: self)
    }
}
