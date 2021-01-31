//
//  ViewController.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var masukButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
        
        masukButton.clipsToBounds = true
        masukButton.layer.cornerRadius = 25
        masukButton.layer.shadowColor = UIColor.systemBlue.cgColor
        masukButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        masukButton.layer.shadowOpacity = 0.25
        masukButton.layer.shadowRadius = 12
        masukButton.layer.masksToBounds = false
        
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
    
    func setLoading(_ loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        emailText.isEnabled = !loading
        passwordText.isEnabled = !loading
    }

    @IBAction func masukPressed(_ sender: UIButton) {
        self.view.resignFirstResponder()
        
        if let email = emailText.text, let password = passwordText.text {
            app.login(credentials: Credentials.emailPassword(email: email, password: password)) { [self](result) in
                
                DispatchQueue.main.async {
                    self.setLoading(false)
                    defaults.setValue(email, forKey: "email")
                    defaults.synchronize()
                    switch result {
                    case .failure(let error):
                        print("Login failed: \(error)");
                     
                        return
                    case .success:
                        let user = app.currentUser
                        print("Login succeeded!")

                        self.setLoading(true)
                       
                        var configuration = user!.configuration(partitionValue: "123")
                      
                        configuration.objectTypes = [User.self]
                        
                        
                        Realm.asyncOpen(configuration: configuration) { [weak self](result) in
                            DispatchQueue.main.async {
                                self!.setLoading(false)
                                switch result {
                                case .failure(let error):
                                    fatalError("Failed to open realm: \(error)")
                                case .success:
                                    
                                    
                                    self?.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func daftarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toDaftar", sender: self)
    }
}

