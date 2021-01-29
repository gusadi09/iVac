//
//  DetailBeritaViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class DetailBeritaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
    }
}
