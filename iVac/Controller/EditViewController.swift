//
//  EditViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var simpanButton: UIButton!
    @IBOutlet weak var datePick: UIDatePicker?
    @IBOutlet weak var namaText: UITextField?
    @IBOutlet weak var emailText: UITextField?
    @IBOutlet weak var jenisKelaminText: UITextField?
    @IBOutlet weak var nikText: UITextField?
    @IBOutlet weak var noTeleponText: UITextField?
    
    lazy var genderPick = UIPickerView()
    let realm = try! Realm()
    var user: Results<User>?
    let defaults = UserDefaults.standard
    let dateFormatter = DateFormatter()
    var arrayGender = ["", "Laki-Laki", "Perempuan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderPick.delegate = self
        genderPick.dataSource = self
        jenisKelaminText!.inputView = genderPick
        
        datePick!.tintColor = .systemBlue

        simpanButton.clipsToBounds = true
        simpanButton.layer.cornerRadius = 25
        simpanButton.layer.shadowColor = UIColor.systemBlue.cgColor
        simpanButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        simpanButton.layer.shadowOpacity = 0.25
        simpanButton.layer.shadowRadius = 12
        simpanButton.layer.masksToBounds = false
        
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdy")
    }
    
    @IBAction func simpanPressed(_ sender: UIButton) {
        user = realm.objects(User.self)
        let tglLahir = dateFormatter.string(from: datePick!.date)
        let userEmail = defaults.string(forKey: "email")
        
        for user in user! {
            if user.email == userEmail {
                if let nama = namaText!.text, let nik = nikText!.text, let email = emailText!.text, let jenisKel = jenisKelaminText!.text, let noTel = noTeleponText!.text {
                    do {
                        try realm.write {
                            user.email = email
                            user.jenisKelamin = jenisKel
                            user.nama = nama
                            user.nik = nik
                            user.no_telepon = noTel
                            user.tglLahir = tglLahir
                        }
                        
                        navigationController?.popViewController(animated: true)
                    } catch {
                        print("error update state : \(error)")
                    }
                }
            }
        }
    }
}

extension EditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayGender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayGender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        jenisKelaminText!.resignFirstResponder()
        jenisKelaminText!.text = arrayGender[row]
    }
}
