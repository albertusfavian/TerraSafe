//
//  DetailInformationPageVC.swift
//  TerraSafe
//
//  Created by Mac-albert on 09/06/21.
//

import UIKit

class DetailInformationPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var tableTrack: UITableView!
    @IBOutlet weak var mountainNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    var listTemp: [Float]?
    var listCondition: [String]?
    var listDate: [String]?
    let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=Malang&appid=3e6254eea851a148b52545bce50cba35&units=metric")
    let requestService = NetworkRequest()
    var indexImage: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableTrack.delegate = self
        tableTrack.dataSource = self
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        requestService.pullJSONData(url: url) { tempArray, conditionArray, dateArray in
            self.listTemp = tempArray
            self.listCondition = conditionArray
            self.listDate = dateArray
            print(self.listTemp, self.listCondition, self.listDate)
        }
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .red
        descriptionLabel.text = "Gunung Papandayan adalah gunung api strato yang terletak di Kabupaten Garut, Jawa Barat tepatnya di Kecamatan Cisurupan."
        locationLabel.text = "Kabupaten Garut, Jawa Barat"
        heightLabel.text = "2665 meter"
        
        
        // Do any additional setup after loading the view.
    }
    
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

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tracksCell", for: indexPath) as? TableTrackTableViewCell
        
        cell?.layer.cornerRadius = 10
        cell?.layer.borderWidth = 3
        cell?.layer.borderColor = tableView.backgroundColor?.cgColor
        cell?.contentView.backgroundColor = UIColor.green
        cell?.trackNameLabel.text = "Sirah Kencong"
        cell?.hourLabel.text = "3hour"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCollectionViewCell
        cell?.layer.cornerRadius = 10
        cell?.layer.backgroundColor = UIColor.red.cgColor
        cell?.dateLabel.text = "9 Juni"
        cell?.tempLabel.text = "9*C"
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 100, height: 100)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


