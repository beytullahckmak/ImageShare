//
//  TableCellTableViewCell.swift
//  ImageShare
//
//  Created by Beytullah Cakmak on 23.04.2025.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var TextEmail: UILabel!
    @IBOutlet weak var TableCellImage: UIImageView!
    @IBOutlet weak var TextYorum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
