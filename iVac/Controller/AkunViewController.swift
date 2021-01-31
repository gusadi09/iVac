//
//  AkunViewController.swift
//  iVac
//
//  Created by Gus Adi on 29/01/21.
//

import UIKit
import RealmSwift

class AkunViewController: UIViewController {

    @IBOutlet weak var profileScrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var jenisKelaminLabel: UILabel!
    @IBOutlet weak var nikLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var noTeleponLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var keluarButton: UIButton!
    @IBOutlet weak var tglLahirLabel: UILabel!
    
    let realm = try! Realm()
    var user: Results<User>?
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = realm.objects(User.self)
        let userEmail = defaults.string(forKey: "email")
         
        for user in user! {
            if user.email == userEmail {
                DispatchQueue.main.async { [self] in
                    emailLabel.text = user.email
                    noTeleponLabel.text = user.no_telepon
                    nikLabel.text = user.nik
                    tglLahirLabel.text = user.tglLahir
                    jenisKelaminLabel.text = user.jenisKelamin
                    namaLabel.text = user.nama
                }
                break
            } else {
                emailLabel.text = "email not found"
            }
        }

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
      
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "Akun"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
        editButton.clipsToBounds = true
        editButton.layer.cornerRadius = 15
        editButton.layer.shadowColor = UIColor.systemBlue.cgColor
        editButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        editButton.layer.shadowOpacity = 0.25
        editButton.layer.shadowRadius = 12
        editButton.layer.masksToBounds = false
        
        keluarButton.clipsToBounds = true
        keluarButton.layer.cornerRadius = 15
        keluarButton.layer.shadowColor = UIColor.systemBlue.cgColor
        keluarButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        keluarButton.layer.shadowOpacity = 0.25
        keluarButton.layer.shadowRadius = 12
        keluarButton.layer.masksToBounds = false
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 15
        loginButton.layer.shadowColor = UIColor.systemBlue.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        loginButton.layer.shadowOpacity = 0.25
        loginButton.layer.shadowRadius = 12
        loginButton.layer.masksToBounds = false
        
        let guide = view.safeAreaLayoutGuide
    
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            
            view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            view.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            // The activity indicator is centered over the rest of the view.
            activityIndicator.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userEmail = defaults.string(forKey: "email")

        for user in user! {
            if user.email == userEmail {
                DispatchQueue.main.async { [self] in
                    emailLabel.text = user.email
                    noTeleponLabel.text = user.no_telepon
                    nikLabel.text = user.nik
                    tglLahirLabel.text = user.tglLahir
                    jenisKelaminLabel.text = user.jenisKelamin
                    namaLabel.text = user.nama
                }
                break
            } else {
                emailLabel.text = "email not found"
            }
        }
        
        DispatchQueue.main.async {
            if app.currentUser != nil {
                self.profileScrollView.isHidden = false
            } else {
                self.profileScrollView.isHidden = true
            }
        }
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func akunButtonPressed(_ sender: UIButton) {
        if sender == loginButton {
            performSegue(withIdentifier: "toLogin", sender: self)
        } else {
            performSegue(withIdentifier: "toEdit", sender: self)
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        app.currentUser?.logOut() { (error) in
            
            DispatchQueue.main.async {
                print("Logged out!")
                
                self.profileScrollView.isHidden = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dst = segue.destination as? EditViewController
        
        let dateString = tglLahirLabel.text
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdy")
        
        guard let dateBirth = dateFormatter.date(from: dateString!) else { return }
        
        if segue.identifier == "toEdit" {
            DispatchQueue.main.async { [self] in
                if let nama = namaLabel.text, let email = emailLabel.text, let nik = nikLabel.text, let jenisKel = jenisKelaminLabel.text, let noTel = noTeleponLabel.text {
                    dst?.namaText?.text = nama
                    dst?.emailText?.text = email
                    dst?.nikText?.text = nik
                    dst?.jenisKelaminText?.text = jenisKel
                    dst?.noTeleponText?.text = noTel
                    dst?.datePick?.setDate(dateBirth, animated: true)
                }
            }
        }
    }
}
