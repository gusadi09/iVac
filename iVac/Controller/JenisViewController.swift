//
//  JenisViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class JenisViewController: UIViewController {

    @IBOutlet weak var jenisTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jenisTable.delegate = self
        jenisTable.dataSource = self
        jenisTable.register(UINib(nibName: "JenisTableViewCell", bundle: nil), forCellReuseIdentifier: "jenisCell")
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
      
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "Jenis Vaksin"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
    }
}

extension JenisViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jenisTable.dequeueReusableCell(withIdentifier: "jenisCell", for: indexPath) as? JenisTableViewCell
        
        //cell?.imageView?.image = UIImage(named: "image 1")
        cell?.titleLabel.text =  "Sinovac (Corona Vac)"
        cell?.isiLabel.text = "CoronaVac adalah nama untuk vaksin COVID-19 yang dikembangkan oleh perusahaan farmasi asal China, Sinovac. Ini adalah vaksin pertama yang berhasil didapatkan oleh pemerintah Indonesia dan dipakai untuk memulai program vaksinasi.Vaksin dibuat dengan teknologi inactivated virus alias memanfaatkan virus yang sudah dilemahkan."
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    
}
