//
//  EditDoctorInfoViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 04/11/21.
//

import UIKit

class EditDoctorInfoViewController: UIViewController {
 

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfConsultorio: UITextField!
    @IBOutlet weak var tfTelefono: UITextField!
    @IBOutlet weak var tfEmergencia: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        actualizaInterfaz()
        
       
    }
    

    func actualizaInterfaz(){
        
        let defaults = UserDefaults.standard
        
        if let nombre = defaults.value(forKey: "nombre") as? String {
            tfNombre.text = nombre
        }
        if let correo = defaults.value(forKey: "correo") as? String {
            tfCorreo.text = correo
        }
        if let consultorio = defaults.value(forKey: "consultorio") as? String {
            tfConsultorio.text = consultorio
        }
        if let telefono = defaults.value(forKey: "numero") as? String {
            tfTelefono.text = telefono
        }
        if let emergencia = defaults.value(forKey: "emergencia") as? String {
            tfEmergencia.text = emergencia
        }
   
      
    }
    @IBAction func guardarDatosInterfaz(){
        
        let defaults = UserDefaults.standard
        
        defaults.setValue(tfNombre.text, forKey: "nombre")
        defaults.setValue(tfCorreo.text, forKey: "correo")
        defaults.setValue(tfConsultorio.text, forKey: "consultorio")
        defaults.setValue(tfTelefono.text, forKey: "numero")
        defaults.setValue(tfEmergencia.text, forKey: "emergencia")

           
        
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        guardarDatosInterfaz()

      let vistaIni = presentingViewController as! DoctorInfoViewController
        vistaIni.actualizaInterfaz()
        
    }

}
