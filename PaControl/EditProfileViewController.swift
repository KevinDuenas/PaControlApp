//
//  EditProfileViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAC: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var sDRegistry: UISwitch!
    @IBOutlet weak var tpOne: UIDatePicker!
    @IBOutlet weak var tpTwo: UIDatePicker!
    @IBOutlet weak var btSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveWithButton(_ sender: UIButton) {
        
        
    }
    
}
