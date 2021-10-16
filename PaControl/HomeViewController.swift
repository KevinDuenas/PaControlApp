//
//  HomeViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Oulets
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbIndications: UILabel!
    @IBOutlet weak var btnRegistry: UIButton!
    
    
    
    
    
    var fechaString : String = "Hoy, "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_MX_POSIX")
        dateFormatter.dateFormat = "EEEE dd"
        lbDate.text =  fechaString + dateFormatter.string(from: NSDate() as Date)
        print(dateFormatter.string(from: NSDate() as Date))
    
    }
    



}
