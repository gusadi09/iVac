//
//  MandiriViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class MandiriViewController: UIViewController {

    @IBOutlet weak var showcaseTable: UITableView!
    @IBOutlet weak var cekStatusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        showcaseTable.delegate = self
        showcaseTable.dataSource = self
        showcaseTable.register(UINib(nibName: "JualTableViewCell", bundle: nil), forCellReuseIdentifier: "jualCell")
        
        cekStatusButton.clipsToBounds = true
        cekStatusButton.layer.cornerRadius = 25
        cekStatusButton.layer.shadowColor = UIColor.systemBlue.cgColor
        cekStatusButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cekStatusButton.layer.shadowOpacity = 0.25
        cekStatusButton.layer.shadowRadius = 12
        cekStatusButton.layer.masksToBounds = false
    }

    @IBAction func cekStatusPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCekStatus", sender: self)
    }
}

extension MandiriViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = showcaseTable.dequeueReusableCell(withIdentifier: "jualCell", for: indexPath) as? JualTableViewCell
        
        cell?.prodLabel.text = "SinoVac"
        cell?.priceLabel.text = "IDR 200.000"
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPesan", sender: self)
    }
}
