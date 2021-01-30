//
//  DaftarViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit
import RealmSwift

class DaftarViewController: UIViewController {

    @IBOutlet weak var daftarButton: UIButton!
    @IBOutlet weak var jenisKelaminText: UITextField!
    @IBOutlet weak var nikText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var noTeleponText: UITextField!
    @IBOutlet weak var namaText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var tglLahir: String = ""
    var realm = try! Realm()
    var partitionValue: String = "123"
    
    lazy var genderPick = UIPickerView()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var arrayGender = ["", "Laki-Laki", "Perempuan"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
        
        genderPick.delegate = self
        genderPick.dataSource = self
        
        daftarButton.clipsToBounds = true
        daftarButton.layer.cornerRadius = 20
        daftarButton.layer.shadowColor = UIColor.systemBlue.cgColor
        daftarButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        daftarButton.layer.shadowOpacity = 0.25
        daftarButton.layer.shadowRadius = 12
        daftarButton.layer.masksToBounds = false
        
        jenisKelaminText.inputView = genderPick
    }
    
    func save(user: User) {
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print("error saving category: \(error)")
        }
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        emailText.isEnabled = !loading
        passwordText.isEnabled = !loading
        daftarButton.isEnabled = !loading
    }
  
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdy")
        
        tglLahir = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func daftarPressed(_ sender: UIButton) {
        let user = realm.objects(User.self)
        let notificationToken = user.observe { (changes) in
             print("Changed: \(changes)")
        }
        if let email = emailText.text, let password = passwordText.text {
            app.emailPasswordAuth.registerUser(email: email, password: password) { [self](error) in
                
                DispatchQueue.main.sync {
                    self.setLoading(false);
                    guard error == nil else {
                        print("Signup failed: \(error!)")
                        
                        return
                    }
                    print("Signup successful!")
                    let newUser = User()

                    newUser.email = email
                    newUser.jenisKelamin = jenisKelaminText.text!
                    newUser.nama = namaText.text!
                    newUser.nik = nikText.text!
                    newUser.no_telepon = noTeleponText.text ?? ""
                    newUser.tglLahir = tglLahir
                    newUser.realm_id = partitionValue

                    self.save(user: newUser)
                    self.navigationController?.popViewController(animated: true)
                    self.resignFirstResponder()
                }
            }
            
            notificationToken.invalidate()
        }
        
    }
}

extension DaftarViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        jenisKelaminText.resignFirstResponder()
        jenisKelaminText.text = arrayGender[row]
    }
}
