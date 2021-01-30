//
//  DetailBeritaViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit

class DetailBeritaViewController: UIViewController {

    @IBOutlet weak var judulLabel: UILabel!
    @IBOutlet weak var sumberLabel: UILabel!
    @IBOutlet weak var tglLabel: UILabel!
    @IBOutlet weak var isiLabel: UILabel!
    @IBOutlet weak var imageTitle: UIImageView!
    
    var arrBerita = BeritaModel(judul: "", sumber: "", tanggal: "", image: UIImage(), isi: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTitle.clipsToBounds = true
        imageTitle.layer.cornerRadius = 10

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        judulLabel.text = arrBerita.judul
        sumberLabel.text = arrBerita.sumber
        tglLabel.text = arrBerita.tanggal
        imageTitle.image = arrBerita.image
        isiLabel.text = arrBerita.isi
    }
}
