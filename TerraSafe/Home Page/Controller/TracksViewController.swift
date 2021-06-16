//
//  TracksViewController.swift
//  TerraSafe
//
//  Created by Gede Wicaksana on 10/06/21.
//

import UIKit

class TracksViewController: UIViewController {
    @IBOutlet weak var trackTableView: UITableView!
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
        let nib = UINib(nibName: "\(TrackTableViewCell.self)", bundle: nil)
        trackTableView.register(nib, forCellReuseIdentifier: "tracksCell")
    }
    

    let tracks = [
        track(trackName: "papandayan", trackTime: "10 menit", trackLength: "10 KM"),
        track(trackName: "papandayan", trackTime: "10 menit", trackLength: "10 KM")
    ]
    
    
    
    
    
}


extension TracksViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tracksCell", for: indexPath) as! TrackTableViewCell
        cell.trackTitle.text = tracks[indexPath.row].trackName
        cell.trackTime.text = tracks[indexPath.row].trackTime
        cell.trackLength.text = tracks[indexPath.row].trackLength
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
