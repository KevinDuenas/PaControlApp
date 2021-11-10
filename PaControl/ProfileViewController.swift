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
    @IBOutlet weak var lbTomaDobleB: UILabel!
    @IBOutlet weak var toma1H: UIDatePicker!
    @IBOutlet weak var imgPP: UIImageView!
    @IBOutlet weak var lbTomaDos: UILabel!
   
    
    @IBOutlet weak var toma2H: UIDatePicker!
    
    
    var nombre : String!
    var ca : Int!
    var peso : Float!
    var edad : Int!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toma1H.isEnabled = false
        toma2H.isEnabled = false
        let app = UIApplication.shared
                NotificationCenter.default.addObserver(self, selector: #selector(guardaDatosInterfaz), name: UIApplication.didEnterBackgroundNotification, object: app)
                actualizaInterfaz()        
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
        
        let tomaDos = defaults.bool(forKey: "tomalb")
        lbTomaDos.isHidden = tomaDos
        if tomaDos == true {
            lbTomaDobleB.text = "No"
        } else {
            lbTomaDobleB.text = "Si"
        }
        
        let tomaTime = defaults.bool(forKey: "tomaT")
        toma2H.isHidden = tomaTime
        
        if let dateValue = defaults.object(forKey: "timeKey1") as? Date {
            toma1H.date = dateValue
        }
        
        if let dateValue2 = defaults.object(forKey: "timeKey2") as? Date {
            toma2H.date = dateValue2
        }
    }
    
    @IBAction func guardaDatosInterfaz() {
            let defaults = UserDefaults.standard
            
            defaults.setValue(lbNombre.text, forKey: "texto")
            defaults.setValue(lbCA.text, forKey: "enteroCA")
            defaults.setValue(lbPeso.text, forKey: "flotante")
            defaults.setValue(lbEdad.text, forKey: "enteroE")
        
        defaults.setValue(lbTomaDos, forKey: "tomalb")
        defaults.setValue(toma2H, forKey: "tomaT")
        defaults.setValue(toma1H, forKey: "timeKey1")
        defaults.setValue(toma2H, forKey: "timeKey2")
        }
    
    @IBAction func unwindEditar(segue: UIStoryboardSegue) {
           lbNombre.text = nombre!
           lbCA.text = "CA: "  + ca.description
           lbPeso.text = "Peso: " + peso.description
           lbEdad.text = "Edad: " + edad.description
           imgPP.image = image
            
       }



}
