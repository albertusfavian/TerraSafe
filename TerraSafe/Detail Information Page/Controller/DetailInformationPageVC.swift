//
//  DetailInformationPageVC.swift
//  TerraSafe
//
//  Created by Mac-albert on 09/06/21.
//

import UIKit

class DetailInformationPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableTrack: UITableView!
    @IBOutlet weak var mountainNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTrack.delegate = self
        tableTrack.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tracksCell", for: indexPath) as? TableTrackTableViewCell
        
        cell?.trackNameLabel.text = "Sirah Kencong"
        cell?.hourLabel.text = "3hour"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
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
