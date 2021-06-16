//
//  SavedVC.swift
//  TerraSafe
//
//  Created by Mac-albert on 07/06/21.
//

import UIKit

class SavedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableSaved: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//
        tableSaved.delegate = self
        tableSaved.dataSource = self
        tableSaved.separatorStyle = .none
        
//         if tableview empty set ishidden true, bring this code to numberOfRowInSection if coredata are available
        tableSaved.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let savedCell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! SavedTableViewCell
        savedCell.mountainName.text = "Gn. Papandayan"
        savedCell.trackVia.text =  "Track Via Sirah Kencong"
        savedCell.hourAndDistance.text = "3 Hour, 8,55km"
        savedCell.backgroundView = UIImageView(image: UIImage(named: "dummy_gambar-1"))
        savedCell.layer.cornerRadius = 10
        savedCell.layer.borderWidth = 4
        savedCell.layer.borderColor = tableView.backgroundColor?.cgColor
        return savedCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 223
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
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
