//
//  CekStatusViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

class CekStatusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
    }

}
