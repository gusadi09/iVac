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
        
        kasusCV.delegate = self
        kasusCV.dataSource = self
        kasusCV.register(UINib(nibName: "KasusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "kasusCell")
        
        beritaCV.delegate = self
        beritaCV.dataSource = self
        
        tipsCV.delegate = self
        tipsCV.dataSource = self
    }

}

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
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kasusCell", for: indexPath) as? KasusCollectionViewCell
        if collectionView == kasusCV {
            cell = kasusCV.dequeueReusableCell(withReuseIdentifier: "kasusCell", for: indexPath) as? KasusCollectionViewCell
            
        } else if collectionView == beritaCV {
            
        } else {
            
        }
        
        return cell!
    }
    
    
}
