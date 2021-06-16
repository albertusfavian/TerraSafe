//
//  CardViewController.swift
//  TerraSafe
//
//  Created by Gede Wicaksana on 10/06/21.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var handleArea: UIView!

    @IBAction func onButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
