//
//  HomeViewController.swift
//  TerraSafe
//
//  Created by Gede Wicaksana on 10/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var mountainCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    
    override func viewDidLoad() {
//        self.title = "Prama"
        let nib = UINib(nibName: "\(HomeCollectionViewCell.self)", bundle: nil)
        mountainCollectionView.register(nib, forCellWithReuseIdentifier: "homeCell")
    }
    
    
    
    
    let mountains = [
        mountain(mountainImage: #imageLiteral(resourceName: "Logo Onboarding"), mountainName: "Gn. Papandayan", mountainTrackCount: "3 Tracks", mountainElevation: "2655"),
        mountain(mountainImage: #imageLiteral(resourceName: "Logo Onboarding"), mountainName: "Gn. Papan", mountainTrackCount: "3 Tracks", mountainElevation: "2655"),
        mountain(mountainImage: #imageLiteral(resourceName: "Logo Onboarding"), mountainName: "Gn. dayan", mountainTrackCount: "3 Tracks", mountainElevation: "2655"),
        mountain(mountainImage: #imageLiteral(resourceName: "Logo Onboarding"), mountainName: "Gn. dayannya", mountainTrackCount: "3 Tracks", mountainElevation: "2655"),
        mountain(mountainImage: #imageLiteral(resourceName: "Logo Onboarding"), mountainName: "Gn. Papa", mountainTrackCount: "3 Tracks", mountainElevation: "2655")
    ]
   
    
    
    
    
}










extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mountains.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.mountImage.image = mountains[indexPath.row].mountainImage
        cell.mountTitle.text = mountains[indexPath.row].mountainName
        cell.mountTrackCount.text = mountains[indexPath.row].mountainTrackCount
        cell.mountElevation.text = mountains[indexPath.row].mountainElevation
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(mountains[indexPath.row].mountainName)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
}
