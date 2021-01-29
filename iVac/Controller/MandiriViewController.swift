//
//  MandiriViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class MandiriViewController: UIViewController {

    @IBOutlet weak var showcaseTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        showcaseTable.delegate = self
        showcaseTable.dataSource = self
        showcaseTable.register(UINib(nibName: "JualTableViewCell", bundle: nil), forCellReuseIdentifier: "jualCell")
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
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPesan", sender: self)
    }
}
