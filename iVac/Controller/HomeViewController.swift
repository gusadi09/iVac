//
//  HomeViewController.swift
//  iVac
//
//  Created by Gus Adi on 28/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var kasusCV: UICollectionView!
    @IBOutlet weak var beritaCV: UICollectionView!
    @IBOutlet weak var tipsCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        kasusCV.delegate = self
        kasusCV.dataSource = self
        kasusCV.register(UINib(nibName: "KasusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "kasusCellView")
        
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
    }

}

//MARK: - Collection View Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == kasusCV {
            return 2
        } else if collectionView == beritaCV {
            return 5
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == kasusCV {
            let cell1 = kasusCV.dequeueReusableCell(withReuseIdentifier: "kasusCellView", for: indexPath) as? KasusCollectionViewCell
            
            return cell1!
        } else if collectionView == beritaCV {
            let cell2 = beritaCV.dequeueReusableCell(withReuseIdentifier: "beritaCell", for: indexPath) as? BeritaCollectionViewCell
            
            return cell2!
        } else {
            let cell3 = tipsCV.dequeueReusableCell(withReuseIdentifier: "tipsCell", for: indexPath) as? TipsCollectionViewCell
            
            return cell3!
        }
    }
    
    
    
}
