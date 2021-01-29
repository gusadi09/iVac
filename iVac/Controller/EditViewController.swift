//
//  EditViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var simpanButton: UIButton!
    @IBOutlet weak var datePick: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePick.tintColor = .systemBlue

        simpanButton.clipsToBounds = true
        simpanButton.layer.cornerRadius = 25
        simpanButton.layer.shadowColor = UIColor.systemBlue.cgColor
        simpanButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        simpanButton.layer.shadowOpacity = 0.25
        simpanButton.layer.shadowRadius = 12
        simpanButton.layer.masksToBounds = false
    }
}
