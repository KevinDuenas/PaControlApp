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
    
    var nombre : String!
    var ca : Int!
    var peso : Float!
    var edad : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizaInterfaz()
        // Do any additional setup after loading the view.
    }
    @IBAction func quitaTeclado(_ sender: Any) {
        view.endEditing(true)
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let nombreTexto = defaults.value(forKey: "texto") as? String {
            tfName.text = nombreTexto
        }
        let caTexto = defaults.integer(forKey: "enteroCA")
        tfAC.text = String(caTexto)
        
        let pesoTexto = defaults.float(forKey: "flotante")
        tfWeight.text = String(pesoTexto)
        
        let edadTexto = defaults.integer(forKey: "enteroE")
        tfAge.text = String(edadTexto)
    }
    
    
    @IBAction func guardaDatosInterfaz() {
        let defaults = UserDefaults.standard
        
        defaults.setValue(tfName.text, forKey: "texto")
        defaults.setValue(tfAC.text, forKey: "enteroCA")
        defaults.setValue(tfWeight.text, forKey: "flotante")
        defaults.setValue(tfAge.text, forKey: "enteroE")
    }
    
    @IBAction func saveWithButton(_ sender: UIButton) {
        
        guardaDatosInterfaz()
        
        
        let vistaIni = presentingViewController as! ProfileViewController
        //Vista anterior debe traer guardaDatos y actualizainterfaz
        vistaIni.actualizaInterfaz()
        
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tfName.text! == "" || tfAC.text! == "" || tfAge.text! == "" || tfWeight.text! == "" {
            let alerta = UIAlertController(title: "Error", message: "Los campos no deben estar vacios", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            return false
        }
        else{
            
            return true
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaIni = segue.destination as! ProfileViewController
        vistaIni.nombre = tfName.text!
        vistaIni.ca = Int(tfAC.text!)
        vistaIni.peso = Float(tfWeight.text!)
        vistaIni.edad = Int(tfAge.text!)
    
    }
    
}
