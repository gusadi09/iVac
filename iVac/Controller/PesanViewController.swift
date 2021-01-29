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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func countStepperPress(_ sender: UIStepper) {
        DispatchQueue.main.async {
            self.countLabel.text = "\(Int(self.countStepper.value))"
        }
    }
}
