//
//  HomeViewController.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var beritaCV: UICollectionView!
    @IBOutlet weak var tipsCV: UICollectionView!
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var totalKasusLabel: UILabel!
    @IBOutlet weak var sembuhLabel: UILabel!
    @IBOutlet weak var meninggalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        beritaCV.delegate = self
        beritaCV.dataSource = self
        beritaCV.register(UINib(nibName: "BeritaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "beritaCell")
        
        tipsCV.delegate = self
        tipsCV.dataSource = self
        tipsCV.register(UINib(nibName: "TipsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tipsCell")
    }
    
    //MARK: - User Interface Setup
    func setupUI() {
        //MARK: navigation custom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
      
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "iVac"
        label.font = .systemFont(ofSize: 35, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
        //MARK: Tab Bar Custom
        tabBarController?.tabBar.backgroundImage = UIImage()
        tabBarController?.tabBar.shadowImage = UIImage()
        tabBarController?.tabBar.backgroundColor = .white
        tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
        tabBarController?.tabBar.layer.shadowOpacity = 0.1
        tabBarController?.tabBar.layer.shadowRadius = 12
        
        //Title View
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 5
        titleView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //allView
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 5
        allView.layer.shadowColor = UIColor.black.cgColor
        allView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        allView.layer.shadowOpacity = 0.2
        allView.layer.shadowRadius = 12
        allView.layer.masksToBounds = false
        
        loadData()
    }

    func loadData() {
        guard let urlString = URL(string: "https://api.kawalcorona.com/indonesia/") else {return}
        
        let request = URLRequest(url: urlString)
        
        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else {return}
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                
                guard let covid = try? decoder.decode([CovidData].self, from: data) else {return}
                
                DispatchQueue.main.async {
                    sembuhLabel.text = covid[0].sembuh
                    totalKasusLabel.text = covid[0].positif
                    meninggalLabel.text = covid[0].meninggal
                }
    
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        
        task.resume()
    }
}

//MARK: - Collection View Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == beritaCV {
            return 5
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == beritaCV {
            let cell1 = beritaCV.dequeueReusableCell(withReuseIdentifier: "beritaCell", for: indexPath) as? BeritaCollectionViewCell
            
            return cell1!
        } else {
            let cell2 = tipsCV.dequeueReusableCell(withReuseIdentifier: "tipsCell", for: indexPath) as? TipsCollectionViewCell
            
            return cell2!
        }
    }
    
    
    
}
