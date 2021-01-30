//
//  MetodeViewController.swift
//  iVac
//
//  Created by Gus Adi on 31/01/21.
//

import UIKit

protocol MetodeDelegate: AnyObject {
    func passDataMetodeBack(namaMetode: String)
}

class MetodeViewController: UIViewController {

    @IBOutlet weak var dompetTable: UITableView!
    @IBOutlet weak var bankTable: UITableView!
    
    var namaMetods = "Go pay"
    var namaMetods2 = "BNI Virtual Account"
    
    var delegate: MetodeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dompetTable.delegate = self
        dompetTable.dataSource = self
        dompetTable.register(UINib(nibName: "DompetDigitalTableViewCell", bundle: nil), forCellReuseIdentifier: "dompetCell")
        
        bankTable.dataSource = self
        bankTable.delegate = self
        bankTable.register(UINib(nibName: "TransferBankTableViewCell", bundle: nil), forCellReuseIdentifier: "bankCell")
    }
    
}

extension MetodeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == bankTable {
            let cell1 = bankTable.dequeueReusableCell(withIdentifier: "bankCell", for: indexPath) as? TransferBankTableViewCell
                cell1?.titleLabel.text = "BNI Virtual Account"
                
                return cell1!
            
        } else {
            let cell2 = dompetTable.dequeueReusableCell(withIdentifier: "dompetCell", for: indexPath) as? DompetDigitalTableViewCell
            
            
            cell2?.titleLabel.text = "Go Pay"
            
            return cell2!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == bankTable {
            self.delegate?.passDataMetodeBack(namaMetode: namaMetods2)
            
        } else {
            self.delegate?.passDataMetodeBack(namaMetode: namaMetods)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
}
