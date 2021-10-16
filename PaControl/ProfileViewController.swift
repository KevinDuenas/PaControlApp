//
//  ProfileViewController.swift
//  PaControl
//
//  Created by Kevin Duenas on 13/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbPeso: UILabel!
    @IBOutlet weak var lbEdad: UILabel!
    @IBOutlet weak var lbCA: UILabel!
    
    
    var nombre : String!
        var ca : Int!
        var peso : Float!
        var edad : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared
                NotificationCenter.default.addObserver(self, selector: #selector(guardaDatosInterfaz), name: UIApplication.didEnterBackgroundNotification, object: app)
                actualizaInterfaz()        // Do any additional setup after loading the view.
    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        if let nombreTexto = defaults.value(forKey: "texto") as? String {
            lbNombre.text = nombreTexto
        }
        let caTexto = defaults.integer(forKey: "enteroCA")
        lbCA.text = "CA: " + caTexto.description
        
        let pesoTexto = defaults.float(forKey: "flotante")
        lbPeso.text = "Peso: " + pesoTexto.description
        
        let edadTexto = defaults.integer(forKey: "enteroE")
        lbEdad.text = "Edad: " + edadTexto.description
    }
    
    @IBAction func guardaDatosInterfaz() {
            let defaults = UserDefaults.standard
            
            defaults.setValue(lbNombre.text, forKey: "texto")
            defaults.setValue(lbCA.text, forKey: "enteroCA")
            defaults.setValue(lbPeso.text, forKey: "flotante")
            defaults.setValue(lbEdad.text, forKey: "enteroE")
        }
    
    @IBAction func unwindEditar(segue: UIStoryboardSegue) {
           lbNombre.text = nombre!
           lbCA.text = "CA: "  + ca.description
           lbPeso.text = "Peso: " + peso.description
           lbEdad.text = "Edad: " + edad.description
       }



}
