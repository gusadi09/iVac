//
//  LokasiVaksinViewController.swift
//  iVac
//
//  Created by Gus Adi on 30/01/21.
//

import UIKit

protocol LokasiVaksinDelegate: AnyObject {
    func passDataBack(namaRs: String)
}

class LokasiVaksinViewController: UIViewController {

    @IBOutlet weak var rsTable: UITableView!
    
    let namaRs = "RS Sanglah"
    let kontakRs = "(0361) 227912"
    let alamatRs = "Jl. Diponegoro, Dauh Puri Klod, Kec. Denpasar Bar., Kota Denpasar, Bali 80113"
    
    weak var delegate: LokasiVaksinDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rsTable.delegate = self
        rsTable.dataSource = self
        rsTable.register(UINib(nibName: "LokasiVaksinTableViewCell", bundle: nil), forCellReuseIdentifier: "rsCell")
    }
}

extension LokasiVaksinViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rsTable.dequeueReusableCell(withIdentifier: "rsCell", for: indexPath) as? LokasiVaksinTableViewCell
        
        cell?.rsImage.image = UIImage(named: "image 8")
        cell?.rsName.text = namaRs
        cell?.rsPhone.text = kontakRs
        cell?.rsAlamat.text = alamatRs
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.passDataBack(namaRs: namaRs)
        
        dismiss(animated: true)
    }
    
}
