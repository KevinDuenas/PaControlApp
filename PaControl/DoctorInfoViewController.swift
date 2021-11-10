//
//  DoctorInfoViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 04/11/21.
//

import UIKit

class DoctorInfoViewController: UIViewController {
    
    
    
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbConsultorio: UILabel!
    @IBOutlet weak var lbTelefono: UILabel!
    @IBOutlet weak var lbCorreo: UILabel!
    @IBOutlet weak var lbEmergencia: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let app = UIApplication.shared
//        NotificationCenter.default.addObserver(self, selector: #selector(guardarDatosInterfaz),
//                                               name: UIApplication.didEnterBackgroundNotification, object: app)

        actualizaInterfaz()
       
    }
    

    func actualizaInterfaz(){
        
        let defaults = UserDefaults.standard
        
        if let nombre = defaults.value(forKey: "nombre") as? String {
            lbNombre.text = nombre
        }
        if let correo = defaults.value(forKey: "correo") as? String {
            lbCorreo.text = correo
        }
        if let consultorio = defaults.value(forKey: "consultorio") as? String {
            lbConsultorio.text = consultorio
        }
        if let telefono = defaults.value(forKey: "numero") as? String {
            lbTelefono.text = telefono
        }
        if let emergencia = defaults.value(forKey: "emergencia") as? String {
            lbEmergencia.text = emergencia
        }
        
      
    }
    
//    @IBAction func guardarDatosInterfaz(){
//
//        let defaults = UserDefaults.standard
//
//        defaults.setValue(lbNombre.text, forKey: "nombre")
//        defaults.setValue(lbCorreo.text, forKey: "correo")
//            defaults.setValue(lbConsultorio.text, forKey: "consultorio")
//
//            if let enteroNumero = Int(lbTelefono.text!){
//                defaults.set(enteroNumero, forKey: "numero")
//            }
//            if let enteroEmergencia = Int(lbEmergencia.text!){
//                defaults.set(enteroEmergencia, forKey: "emergencia")
//            }
//
//        }
    
//    override func prepare(for: UIStoryboardSegue, sender: Any?){
//        guardarDatosInterfaz()
//    }
}
