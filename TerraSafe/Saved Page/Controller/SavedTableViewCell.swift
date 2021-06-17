//
//  SavedTableViewCell.swift
//  TerraSafe
//
//  Created by Mac-albert on 07/06/21.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var listSaved: UIView!
    @IBOutlet weak var mountainName: UILabel!
    @IBOutlet weak var trackVia: UILabel!
    @IBOutlet weak var hourAndDistance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
