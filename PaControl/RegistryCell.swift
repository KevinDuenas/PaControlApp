//
//  RegistryCell.swift
//  PaControl
//
//  Created by Kevin Duenas on 15/10/21.
//

import UIKit

class RegistryCell: UITableViewCell {
    
    
    @IBOutlet weak var lbdate: UILabel!
    
    @IBOutlet weak var imgA1: UIImageView!
    @IBOutlet weak var imgA2: UIImageView!
    @IBOutlet weak var imgA3: UIImageView!
    
    @IBOutlet weak var imgB1: UIImageView!
    @IBOutlet weak var imgB2: UIImageView!
    @IBOutlet weak var imgB3: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let circle = UIImage(named: "circulation")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
