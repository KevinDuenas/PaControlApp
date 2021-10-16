//
//  RegistryCell.swift
//  PaControl
//
//  Created by Kevin Duenas on 15/10/21.
//

import UIKit

class RegistryCell: UITableViewCell {
    @IBOutlet weak var lbdate: UILabel!
    @IBOutlet weak var lbPA: UILabel!
    @IBOutlet weak var lbCA: UILabel!
    @IBOutlet weak var lbFC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
